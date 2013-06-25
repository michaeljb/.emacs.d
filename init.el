;; PATH
(add-to-list 'load-path user-emacs-directory)

(require 'packages)
(require 'display)
(require 'settings)

(require 'keyboard)

;; CUSTOM
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

(add-to-list 'auto-mode-alist (cons (rx ".js" eos) 'js2-mode))

;; (setq filesets-menu-path ("file"))
;; (setq filesets-menu-before "Open File...")

(filesets-init) 
(setq filesets-cache-save-often-flag t)
