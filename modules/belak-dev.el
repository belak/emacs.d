;;; belak-dev -- Common development related settings

;;; Commentary:

;;; Code:

;; company-mode is used as a completion system.

(use-package company
  :diminish company-mode
  :config
  (defmacro belak--register-company-backend (hook backend)
    `(add-hook ,hook (lambda ()
                       (set (make-local-variable 'company-backends) (list ,backend)))))

  (setq company-tooltip-limit 20
        company-idle-delay 0
        company-echo-delay 0
        company-minimum-prefix-length 1
        company-selection-wrap-around t
        company-show-numbers t
        company-tooltip-align-annotations t)

  (global-company-mode))

(use-package eldoc
  :ensure nil
  :diminish eldoc-mode)

;; flycheck-mode is used for linters and catching compilation errors.

(use-package flycheck
  :diminish flycheck-mode
  :config
  (defalias 'flycheck-show-error-at-point-soon 'flycheck-show-error-at-point)
  (global-flycheck-mode))

;; Project based navigation is pretty much the best thing ever.

(use-package projectile
  :diminish projectile-mode
  :commands
  projectile-project-p
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :config
  (projectile-mode +1)
  (setq projectile-known-projects-file (concat belak-local-dir "projectile-bookmarks.eld")))

(provide 'belak-dev)

;;; belak-dev.el ends here
