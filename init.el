;; (package-initialize) ;; added aggressively by package.el, commented here and
                        ;; handled in mjb-packages-emacs25.el

(setq custom-file (locate-user-emacs-file ".custom.el"))
(load custom-file t t)

(setq settings-dir (expand-file-name "settings" user-emacs-directory))
(setq os-dir (expand-file-name "os" settings-dir))
(setq packages-dir (expand-file-name "packages" settings-dir))
(add-to-list 'load-path settings-dir)
(add-to-list 'load-path os-dir)
(add-to-list 'load-path packages-dir)

(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(setq inhibit-startup-screen t)

(require 'mjb-packages)

(require 'mjb-backups)
(require 'mjb-keybindings)
(require 'mjb-os)

(require 'mjb-magit)

;; buffer

(set-fringe-mode 0)
(setq linum-format "%d ")

(setq shift-select-mode nil)

;; modeline

(setq line-number-mode t)
(setq column-number-mode t)



;; mini-buffer

(defalias 'yes-or-no-p 'y-or-n-p)

(ido-mode)

(setq echo-keystrokes 0.01)

(setq ring-bell-function (lambda () (message "*woop* *woop* *woop* *woop* *woop* *woop* *woop* *woop* *woop* *woop* *woop* *woop* *woop* *woop* *woop* *woop* ")(sleep-for .15)))
