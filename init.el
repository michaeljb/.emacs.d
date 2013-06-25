;; PATH
(add-to-list 'load-path user-emacs-directory)

(require 'settings-package)
(require 'settings-buffer)
(require 'settings-general)
(require 'settings-extensions)
(require 'settings-developer)

(require 'display-frame)
(require 'display-window)
(require 'display-mode-line)
(require 'display-minibuffer)
(require 'display-theme)

(require 'settings-keyboard)

;; CUSTOM
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

(add-to-list 'auto-mode-alist (cons (rx ".js" eos) 'js2-mode))

(require 'filesets+)

;; (setq filesets-menu-path ("file"))
;; (setq filesets-menu-before "Open File...")

(filesets-init) 
(setq filesets-cache-save-often-flag t)
