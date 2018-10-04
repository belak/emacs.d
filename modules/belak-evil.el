;;; belak-evil.el --- evil-mode related packages and settings

;;; Commentary:

;;; Settings:

(defvar belak-evil-enabled t)

;;; Code:

(use-package evil
  :if belak-evil-enabled
  :defer nil
  :diminish evil-mode
  :init
  (setq evil-echo-state t
	evil-want-C-w-in-emacs-state t
	;; We want to let evil-collection set keybinds for any
	;; additional modes.
	evil-want-integration t
	evil-want-keybinding nil)
  :config
  ;; TODO: Not sure why this has to be called here.
  ;;(general-evil-setup)
  ;; Actually enable evil-mode.
  (evil-mode 1))

;; Add gc for commenting

(use-package evil-commentary
  :after evil
  :diminish evil-commentary-mode
  :config
  (evil-commentary-mode 1))

(use-package evil-easymotion
  :after evil
  :config
  ;; TODO: Find a better prefix because we want to use space as our
  ;; leader.
  (evilem-default-keybindings "SPC"))

;; Add % as a bind to jump between matching tags.

(use-package evil-matchit
  :after evil
  :config
  (global-evil-matchit-mode 1))

;; I prefer using C-a and C-e because they work both inside and
;; outside normal mode.

(use-package evil-rsi
  :after evil
  :diminish evil-rsi-mode
  :config
  (evil-rsi-mode 1))

;; Include community-maintained keybinds for additional packages.

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(provide 'belak-evil)

;;; belak-evil.el ends here
