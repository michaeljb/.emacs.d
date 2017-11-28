(setq package-user-dir "~/.emacs.elpa")

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")))

(setq package-enable-at-startup nil)
(package-initialize)

;; install use-package before we install the other packages
(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'bind-key)

(setq use-package-always-ensure t)

(use-package ace-window
  :bind (("M-o" . ace-window))
  :config
  (setq aw-keys '(?a ?s ?d ?f ?j ?k ?l ?g ?h ?q ?w ?e ?r ?u ?i ?o ?p ?z ?x ?c ?v ?m ?t ?y ?b))
  (setq aw-scope 'frame)
  (global-unset-key (kbd "C-x o")))

(use-package ag)

(use-package bool-flip
  :bind (("C-c b" . bool-flip-do-flip)))

(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file)
         ("C-c f" . counsel-git)
         ("C-c s g" . counsel-git-grep)
         ("C-c s s" . counsel-ag))
  :config
  (add-to-list 'ivy-initial-inputs-alist '(counsel-M-x . "")))

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
  :bind (("C-x b" . ivy-switch-buffer))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t))

(use-package ivy-hydra)

(use-package magit
  :ensure ivy
  :ensure t
  :bind (("C-c g" . magit-status))
  :config
  (setq magit-refresh-status-buffer nil)
  (setq magit-completing-read-function 'ivy-completing-read)
  (setq vc-handled-backends (delq 'Git vc-handled-backends)))

(use-package multiple-cursors
  :config
  (require 'mc-cycle-cursors))

;; search compatible with multiple cursors
(use-package phi-search
  :bind (("M-s M-s" . phi-search)
	 ("M-s s" . phi-search)))

(use-package rainbow-delimiters)

;; used for sorting commands for counsel-M-x
(use-package smex
  :config
  (setq smex-save-file (concat user-emacs-directory ".smex-items")))

(use-package swiper
  :bind (("C-M-r" . swiper)
	 ("C-M-s" . swiper)))

(use-package wgrep)

(use-package wc-mode)

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
  (setq js2-bounce-indent-p t)
  (setq js2-basic-offset 2)
  (setq js2-mode-show-strict-warnings nil))

;; jsx
(use-package rjsx-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.jsx\\'" . rjsx-mode)))

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
(use-package python)

(use-package pyvenv
  :init
  (setenv "WORKON_HOME" "/Users/mbrandt/anaconda3/envs")
  (pyvenv-mode 1)
  (pyvenv-tracking-mode 1)
  :config
  (setq pyvenv-tracking-mode t))

(use-package elpy
  :config
  (elpy-enable))

(use-package flycheck
  :config
  (remove-hook 'elpy-modules 'elpy-module-flymake)
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(use-package nose
  :config
  (add-hook 'python-mode-hook
            (lambda ()
              (local-set-key "\C-ca" 'nosetests-all)
              (local-set-key "\C-cm" 'nosetests-module)
              (local-set-key "\C-c." 'nosetests-one)
              (local-set-key "\C-cpa" 'nosetests-pdb-all)
              (local-set-key "\C-cpm" 'nosetests-pdb-module)
              (local-set-key "\C-cp." 'nosetests-pdb-one))))

(use-package py-autopep8)

(use-package auto-complete)

;; yaml
(use-package yaml-mode)


(provide 'mjb-packages)
