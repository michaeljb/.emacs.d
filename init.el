;; (package-initialize) ;; added aggressively by package.el, commented here and
                        ;; handled in mjb-packages.el

(setq custom-file (locate-user-emacs-file ".custom.el"))
(load custom-file t t)

;; load path for emacs major version-specific settings
(defvar mjb-emacs-version-name (cond ((string-match "^24\\." emacs-version) "settings-emacs24")
                                     ((string-match "^25\\." emacs-version) "settings-emacs25")))
(defvar mjb-emacs-version-dir (expand-file-name mjb-emacs-version-name user-emacs-directory))
(add-to-list 'load-path mjb-emacs-version-dir)

;; load path for all other settings
(defvar settings-dir (expand-file-name "settings" user-emacs-directory))
(defvar dev-dir (expand-file-name "dev" settings-dir))
(defvar os-dir (expand-file-name "os" settings-dir))
(add-to-list 'load-path settings-dir)
(add-to-list 'load-path dev-dir)
(add-to-list 'load-path os-dir)

(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(setq inhibit-startup-screen t)

(require 'mjb-packages)

(load-theme 'zenburn t)

(require 'mjb-keybindings)
(require 'mjb-os)

(require 'mjb-buffer)
(require 'mjb-minibuffer)

(require 'mjb-filesystem)

(require 'mjb-dev)
(require 'mjb-python)
(require 'mjb-javascript)
(require 'mjb-json)

(desktop-save-mode 1)

(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

(hide/show-comments)
;;(projectile-global-mode)

(setq magit-completing-read-function 'ivy-completing-read)
;;(setq projectile-completion-system 'ivy)
