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
  :bind (("M-o" . ace-window)
         ("C-x o" . ace-window)
         ("C-M-O" . aw-flip-window))
  :config
  (setq aw-keys '(?a ?s ?d ?f ?j ?k ?l ?g ?h ?q ?w ?e ?r ?u ?i ?o ?p ?z ?x ?c ?v ?m ?t ?y ?b ?n))
  (setq aw-scope 'frame)
  (global-unset-key (kbd "C-x o")))

(use-package winnow)

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

(use-package flycheck)

(use-package git-timemachine)

(use-package hydra
  :ensure expand-region
  :ensure multiple-cursors
  :ensure t
  :bind (("M-C" . hydra-mjb-mc/body))
  :config
  (defhydra hydra-mjb-mc (:hint "")

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
	 ("C-M-s" . swiper))
  :config
  (setq swiper-include-line-number-in-search nil))

(use-package wgrep)

(use-package which-key
  :config
  (which-key-mode))

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

;; less
(use-package less-css-mode)

;; markdown
(use-package markdown-mode)

;; php
(use-package php-mode)

;; puppet
(use-package puppet-mode)

;; python
(use-package python
  :config
  (add-to-list 'auto-mode-alist '("\\.pyi\\'" . python-mode))
  (setq python-indent-guess-indent-offset nil))

(defvar mjb-python-before-save-hooks nil
  "List of stuff to run when saving python files.")
(defun mjb-run-python-before-save-hooks ()
  "Run stuff when saving python files."
  (when (eq major-mode 'python-mode)
    (run-hooks 'mjb-python-before-save-hooks)))
(add-hook 'before-save-hook 'mjb-run-python-before-save-hooks t)

;; requires `pip install isort`
(use-package py-isort
  :config
  (add-hook 'mjb-python-before-save-hooks 'py-isort-before-save))

;; elpy with pipenv; have WORKON_HOME set to pipenv venv dir
;; (`export WORKON_HOME=$HOME/.local/share/virtualenvs`), then
;; `M-x pyvenv-workon` will let you select the appropriate env
;;
;; TODO: global venv?  project-specific envs?

;; requires `pip install black flake8 jedi`
;; optional pip packages: autopep8 pep8 rope yapf
(use-package elpy
  :ensure flycheck
  :bind (("C-c n" . flycheck-next-error)
         ("C-c p" . flycheck-previous-error))
  :config
  (elpy-enable)
  (remove-hook 'elpy-modules 'elpy-module-flymake)
  (add-hook 'elpy-mode-hook 'flycheck-mode)
  (add-hook 'mjb-python-before-save-hooks 'elpy-black-fix-code t)

  (flycheck-add-next-checker 'python-flake8 'python-pylint t)

  ;; check with mypy
  ;; requires `pip install mypy`
  ;; assumes mypy.ini exists with desired config
  (flycheck-define-checker
      python-mypy ""
      :command ("mypy" "--show-column-numbers"
                source-original)
      :error-patterns
      ((error line-start (file-name) ":" line ":" column ": error:" (message) line-end))
      :modes python-mode)
  (add-to-list 'flycheck-checkers 'python-mypy t)
  (flycheck-add-next-checker 'python-pylint 'python-mypy t))

;; typescript
(use-package tide)

(use-package web-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
  (add-hook 'web-mode-hook
            (lambda ()
              (when (string-equal "tsx" (file-name-extension buffer-file-name))
                (setup-tide-mode))))
  ;; enable typescript-tslint checker
  (flycheck-add-mode 'typescript-tslint 'web-mode))

;; yaml
(use-package yaml-mode)


(provide 'mjb-packages)
