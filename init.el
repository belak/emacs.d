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

  ;; TODO: helm and ido should be mutually exclusive but you can technically
  ;; enable both.
  (require 'belak-ido)
  (require 'belak-helm)

  ;; Load dev packages
  (require 'belak-dev)

  ;; Load language bundles
  (require 'belak-lang-python)
  )
