;;; belak-org.el --- org-mode related config

;;; Commentary:

;;; Code:

(use-package org
  :pin org
  :ensure org-plus-contrib
  :mode ("\\.org\\'" . org-mode)
  :general
  ("C-c a" 'org-agenda)
  ("C-c b" 'org-switchb)
  ("C-c c" 'org-capture)
  :config
  (setq org-log-done t
        org-log-done-with-time t
        org-support-shift-select t)

  (setq org-agenda-files '("~/Dropbox/org/"))

  (add-hook 'org-mode-hook 'auto-fill-mode))

(provide 'belak-org)

;;; belak-org.el ends here
