(setq user-emacs-directory (file-name-directory load-file-name))

;; Add the modules directory to the load path and start loading
;; everything.
(add-to-list 'load-path (concat user-emacs-directory "modules"))

(let ((debug-on-error t)
      (debug-on-quit t))
  ;; Load core, followed by package management, followed by UI tweaks.
  (require 'belak-core)
  (require 'belak-packages)
  (require 'belak-ui)

  ;; We use an bizarre mix between evil and emacs. I try to use emacs
  ;; for navigation, but emacs for almost everything else.
  (require 'belak-evil)

  ;; NOTE: helm and ido should be mutually exclusive but you can
  ;; technically enable both.
  (require 'belak-ido)
  (require 'belak-helm)

  ;; org-mode is special enough to deserve its own section and not be
  ;; lumped in with the lang bundles.
  (require 'belak-org)

  ;; Load dev packages
  (require 'belak-dev)

  ;; Load language bundles
  (require 'belak-lang-elixir)
  (require 'belak-lang-go)
  (require 'belak-lang-python)
  )
