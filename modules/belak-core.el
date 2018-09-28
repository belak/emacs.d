;;; belak-core --- Core emacs settings and helpers

;;; Commentary:

;;; Code:

;; Constants

(defconst IS_MAC   (eq system-type 'darwin))
(defconst IS-LINUX (eq system-type 'gnu/linux))

;; Bootstrap helpers

(defun belak--display-benchmark ()
  (message "Loaded in %.03fs"
       (float-time (time-subtract (current-time) before-init-time))))
(add-hook 'emacs-startup-hook 'belak--display-benchmark)

;; Internal startup optimization variables

(defvar belak--gc-cons-threshold (* 16 1024 1024))
(defvar belak--gc-cons-upper-limit (* 256 1024 1024))
(defvar belak--file-name-handler-alist file-name-handler-alist)

;; Startup optimization

(defun belak--restore-startup-optimizations ()
  (setq file-name-handler-alist belak--file-name-handler-alist)
  (run-with-idle-timer
   3 nil (lambda () (setq-default gc-cons-threshold belak--gc-cons-threshold))))

(setq gc-cons-threshold belak--gc-cons-upper-limit)
(setq file-name-handler-alist nil)
(add-hook 'emacs-startup-hook 'belak--restore-startup-optimizations)

;; Emacs core configuration

;; UTF-8 as the default encoding (Copied from doom-emacs)
(when (fboundp 'set-charset-priority)
  (set-charset-priority 'unicode))     ; pretty
(prefer-coding-system        'utf-8)   ; pretty
(set-terminal-coding-system  'utf-8)   ; pretty
(set-keyboard-coding-system  'utf-8)   ; pretty
(set-selection-coding-system 'utf-8)   ; perdy
(setq locale-coding-system   'utf-8)   ; please
(setq-default buffer-file-coding-system 'utf-8) ; with sugar on top

;; Directories

(defvar belak-emacs-dir user-emacs-directory)
(defvar belak-local-dir (concat belak-emacs-dir ".local/"))

(setq-default
 ;; Be as quiet as we can at startup.
 inhibit-startup-message t
 inhibit-startup-echo-area-message user-login-name
 initial-major-mode 'fundamental-mode
 initial-scratch-message nil

 ;; Disable history and backup files. They really just get in the
 ;; way. TODO: change some of these to use directories instead.
 auto-save-default nil
 create-lockfiles nil
 make-backup-files nil

 ;; Security
 ;;
 ;; Increasing the minimum prime bits size to something larger than the
 ;; default settings stops all the GnuTLS warnings from showing up.
 gnutls-min-prime-bits 4096)

;; We still want to be able to have non-public configs, such as for
;; passwords and what not, so we put them in a separate file and load
;; it, but ignore errors, for instance if it doesn't exist. This has
;; the added advantage of making it so customizations will go to this
;; file and not to init.el, which is version controlled.

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file t)

(provide 'belak-core)

;;; belak-core.el ends here
