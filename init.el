;; (package-initialize) ;; added aggressively by package.el, commented here and
                        ;; handled in mjb-packages.el

(setq initial-buffer-choice user-emacs-directory)

(setq custom-file (locate-user-emacs-file ".custom.el"))
(load custom-file t t)

;; load path for all other settings
(defvar settings-dir (expand-file-name "settings" user-emacs-directory))
(defvar dev-dir (expand-file-name "dev" settings-dir))
(defvar os-dir (expand-file-name "os" settings-dir))
(add-to-list 'load-path settings-dir)
(add-to-list 'load-path dev-dir)
(add-to-list 'load-path os-dir)

;; hide some visual stuff
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(setq inhibit-startup-screen t)

(require 'gnutls)
(add-to-list 'gnutls-trustfiles "/home/linuxbrew/.linuxbrew/etc/ca-certificates/cert.pem")

(require 'mjb-packages)

(require 'mjb-keybindings)
(require 'mjb-os)

(require 'mjb-buffer)
(require 'mjb-minibuffer)

(require 'mjb-filesystem)

(require 'mjb-dev)

(desktop-save-mode 1)

(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

(setq dired-dwim-target t)
(put 'narrow-to-region 'disabled nil)
