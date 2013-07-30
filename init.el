;; PATH
(add-to-list 'load-path user-emacs-directory)

(require 'packages)
(require 'display)
(require 'settings)

(require 'keyboard)

(add-to-list 'auto-mode-alist (cons (rx ".js" eos) 'js2-mode))

(setq auto-mode-alist  (cons '("Gemfile$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist  (cons '("Gemfile.lock$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist  (cons '("Rakefile$" . ruby-mode) auto-mode-alist))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))


;; CUSTOM
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq-default js2-basic-offset 2)

;; (setq filesets-menu-path ("file"))
;; (setq filesets-menu-before "Open File...")

(filesets-init) 
(setq filesets-cache-save-often-flag t)
(load "~/.emacs.d/floobits/floobits.el")
