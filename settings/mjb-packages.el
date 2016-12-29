(setq package-user-dir "~/.emacs.elpa")

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")))

(setq package-enable-at-startup nil)
(package-initialize)

;; install use-package before we install the other packages
(defvar mjb-package-list
  '(use-package))
(require 'mjb-package-init)

(eval-when-compile
  (require 'use-package))
(require 'bind-key)

(setq use-package-always-ensure t)


(use-package ag)

(use-package bool-flip
  :bind (("C-c b" . bool-flip-do-flip)))

(use-package csv-mode)

(use-package dash)

(use-package ein)

(use-package expand-region
  :bind (("C-=" . er/expand-region)))

(use-package hide-comnt
  :bind (("C-x /" . hide/show-comments-toggle)))

(use-package hydra
  :ensure expand-region
  :ensure multiple-cursors
  :ensure t
  :bind (("M-C" . hydra-mjb-mc/body))
  :config
  (defhydra hydra-mjb-mc (:hint nil)

    ("C" mc/edit-lines :exit t)
    ("R" set-rectangular-region-anchor)

    ("=" er/expand-region)

    (">" mc/mark-next-like-this-word)
    ("." mc/unmark-next-like-this)
    ("l" mc/skip-to-next-like-this)

    ("<" mc/mark-previous-like-this)
    ("," mc/unmark-previous-like-this)
    ("k" mc/skip-to-previous-like-this)

    ("a" mc/mark-all-like-this)

    ("#" (lambda (arg num)
	   (interactive (list (prefix-numeric-value current-prefix-arg)
			      (read-number "Starting number: " 0)))
	   (mc/insert-numbers num)))

    ("s" mc/sort-regions)
    ("f" mc/reverse-regions)

    ("m" mc/mark-pop)

    ("n" mc/mark-next-lines)
    ("p" mc/mark-previous-lines)

    ("v" mc/cycle-forward)
    ("V" mc/cycle-backward)

    ("q" nil)))


(use-package ivy
  :bind (("C-x b" . ivy-switch-buffer)))
(use-package smex) ;; used for sorting commands for  counsel-M-x
(use-package counsel
  :bind (("M-x" . counsel-M-x)
         ("C-c C-c M-x" . execute-extended-command)
	 ("C-x C-f" . counsel-find-file)
	 ("C-c f" . counsel-git)
	 ("C-c j" . counsel-git-grep)
	 ("C-c k" . counsel-ag)))
(use-package swiper
  :bind (("C-M-s" . swiper)))

(use-package ivy-hydra)

(use-package magit
  :ensure ivy
  :ensure t
  :bind (("C-c g" . magit-status))
  :config
  (setq magit-refresh-status-buffer nil)
  (setq magit-completing-read-function 'ivy-completing-read))

(use-package multiple-cursors
  :config
  (require 'mc-cycle-cursors))

;; search compatible with multiple cursors
(use-package phi-search
  :bind (("M-s M-s" . phi-search)
	 ("M-s s" . phi-search)))

(use-package rainbow-delimiters)

(use-package wc-mode)

(use-package wgrep)

(use-package wgrep-ag)

(use-package zenburn-theme
  :config
  (load-theme 'zenburn t))

;; docker
(use-package dockerfile-mode)

;; gherkin
(use-package feature-mode)

;; javascript
(use-package js2-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  (add-to-list 'auto-mode-alist '("\\.jsx\\'" . js2-jsx-mode))
  (setq js2-mode-show-strict-warnings nil))

;; json
(use-package json-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.babelrc\\'" . json-mode))
  (add-to-list 'auto-mode-alist '("\\.eslintrc\\'" . json-mode)))

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
