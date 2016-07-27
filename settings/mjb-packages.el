(setq package-user-dir "~/.emacs.elpa")

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")))

(setq package-enable-at-startup nil)
(package-initialize)

;; install use-package before we install the other packages
(defvar mjb-package-list
  '(use-package))
(require 'mjb-install-packages)

(eval-when-compile
  (require 'use-package))
(setq use-package-always-ensure t)

(use-package ag)

(use-package counsel)

(use-package csv-mode)

(use-package dash)

(use-package ein)

(use-package expand-region)

(use-package hide-comnt)

(use-package hydra)

(use-package ivy)

(use-package ivy-hydra)

(use-package magit
  :ensure ivy
  :init
  (setq magit-completing-read-function 'ivy-completing-read))

(use-package multiple-cursors)

(use-package phi-search)

(use-package projectile
  :disabled t
  :ensure ivy
  :init
  (projectile-global-mode)
  (setq projectile-completion-system 'ivy)
  (setq projectile-known-projects-file "~/.emacs.d/.projectile-bookmarks.eld")
  (setq projectile-use-git-grep t))

(use-package rainbow-delimiters)

(use-package smex)

(use-package swiper)

(use-package wc-mode)

(use-package wgrep)

(use-package wgrep-ag)

(use-package zenburn-theme
  :init
  (load-theme 'zenburn t))

;; docker
(use-package dockerfile-mode)

;; gherkin
(use-package feature-mode)

;; javascript
(use-package js2-mode)

;; json
(use-package json-mode)

(use-package json-reformat)

(use-package json-snatcher)

;; markdown
(use-package markdown-mode)

;; puppet
(use-package puppet-mode)

;; python
(use-package elpy)

(use-package nose)

(use-package py-autopep8)

(use-package pyvenv)

;; yaml
(use-package yaml-mode)

(provide 'mjb-packages)
