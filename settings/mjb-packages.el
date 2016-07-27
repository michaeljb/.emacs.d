(setq package-user-dir "~/.emacs.elpa")

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")))

(setq package-enable-at-startup nil)
(package-initialize)

(defvar mjb-package-list
  '(use-package))

;; install use-package
(require 'mjb-install-packages)

(eval-when-compile
  (require 'use-package))

(use-package ag
  :ensure t)
(use-package counsel
  :ensure t)
(use-package csv-mode
  :ensure t)
(use-package dash
  :ensure t)
(use-package ein
  :ensure t)
(use-package expand-region
  :ensure t)
(use-package hide-comnt
  :ensure t)
(use-package hydra
  :ensure t)
(use-package ivy
  :ensure t)
(use-package ivy-hydra
  :ensure t)
(use-package magit
  :ensure t)
(use-package multiple-cursors
  :ensure t)
(use-package phi-search
  :ensure t)
(use-package projectile
  :ensure t)
(use-package rainbow-delimiters
  :ensure t)
(use-package smex
  :ensure t)
(use-package swiper
  :ensure t)
(use-package wc-mode
  :ensure t)
(use-package wgrep
  :ensure t)
(use-package wgrep-ag
  :ensure t)
(use-package zenburn-theme
  :ensure t)
(use-package dockerfile-mode
  :ensure t)
(use-package feature-mode
  :ensure t)
(use-package js2-mode
  :ensure t)
(use-package json-mode
  :ensure t)
(use-package json-reformat
  :ensure t)
(use-package json-snatcher
  :ensure t)
(use-package markdown-mode
  :ensure t)
(use-package puppet-mode
  :ensure t)
(use-package elpy
  :ensure t)
(use-package nose
  :ensure t)
(use-package py-autopep8
  :ensure t)
(use-package pyvenv
  :ensure t)
(use-package yaml-mode
  :ensure t)

(provide 'mjb-packages)
