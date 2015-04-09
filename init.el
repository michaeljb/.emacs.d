;;; init --- michaeljb emacs configuration
;;; Commentary:

;; "Emacs is undoubtedly the most powerful programmer's editor in existence."
;; - Eric S. Raymond, "The Art of UNIX Programming"

;;; Code:

(setq inhibit-startup-screen t)
(set-fringe-mode 0)

(unless (boundp 'user-emacs-directory)
  (defvar user-emacs-directory "~/.emacs.d/"
    "See also 'locate-user-emacs-file'."))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; -------------------------------------
;; Packages
;; -------------------------------------

(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)

(defvar michaeljb-packages
  '(ac-js2
    auto-complete
    better-defaults
    edit-server
    exec-path-from-shell
    expand-region
    ;; flycheck
    helm
    hl-line+
    js2-refactor
    man-commands
    py-autopep8
    rainbow-delimiters
    rubocop
    smex

    ;; modes
    git-commit-mode
    git-rebase-mode
    jade-mode
    js2-mode
    json-mode
    markdown-mode
    puppet-mode
    puppetfile-mode
    scss-mode
    web-mode
    yaml-mode

    ;; themes
    solarized-theme))

(dolist (p michaeljb-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(add-to-list 'load-path "~/.emacs.d/lisp/")

;; -------------------------------------
;; General stuff
;; -------------------------------------

(setq linum-format "%d ")

(exec-path-from-shell-initialize)

;; Auto refresh buffers
(global-auto-revert-mode 1)

;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

(server-start)

;; Edit with Emacs for Chrome
(require 'edit-server)
(edit-server-start)

;; Session Saving
(setq desktop-dirname user-emacs-directory)
(desktop-save-mode t)

;; echo keystrokes quickly
(setq echo-keystrokes 0.01)

;; Answering just 'y' or 'n' will do
(defalias 'yes-or-no-p 'y-or-n-p)

(setq line-number-mode t)
(setq column-number-mode t)

(setq ring-bell-function 'ignore)

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; my escape key is broken, getting it back in place results in unwanted closing of windows
(global-unset-key (kbd "ESC ESC ESC"))

;; Real emacs knights don't use shift to mark things
(setq shift-select-mode nil)

;; org-mode stuff
;; http://orgmode.org/worg/org-tutorials/orgtutorial_dto.html
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; http://sachachua.com/blog/2007/12/clocking-time-with-emacs-org/
(eval-after-load 'org
  '(progn
     (defun wicked/org-clock-in-if-starting ()
       "Clock in when the task is marked STARTED."
       (when (and (string= state "STARTED")
		  (not (string= last-state state)))
	 (org-clock-in)))
     (add-hook 'org-after-todo-state-change-hook
	       'wicked/org-clock-in-if-starting)
     (defadvice org-clock-in (after wicked activate)
      "Set this task's status to 'STARTED'."
      (org-todo "STARTED"))
    (defun wicked/org-clock-out-if-waiting ()
      "Clock out when the task is marked WAITING."
      (when (and (string= state "WAITING")
                 (equal (marker-buffer org-clock-marker) (current-buffer))
                 (< (point) org-clock-marker)
	         (> (save-excursion (outline-next-heading) (point))
		    org-clock-marker)
		 (not (string= last-state state)))
	(org-clock-out)))
    (add-hook 'org-after-todo-state-change-hook
	      'wicked/org-clock-out-if-waiting)))

;; -------------------------------------
;; Tramp
;; -------------------------------------

(setq tramp-default-method "ssh")

;; -------------------------------------
;; Mac Settings
;; -------------------------------------

;; Option is Alt
(setq mac-option-key-is-meta nil)
(setq mac-option-modifier 'alt)

;; left Command is Meta
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)

;; right Command is Super
(setq mac-right-command-modifier 'super)

;; default behavior on Mac is for super to be similar to command-key in other Mac applications; get rid of these bindings
(global-unset-key (kbd "s-a"))
(global-unset-key (kbd "s-b"))
(global-unset-key (kbd "s-c"))
(global-unset-key (kbd "s-d"))
(global-unset-key (kbd "s-e"))
(global-unset-key (kbd "s-f"))
(global-unset-key (kbd "s-g"))
(global-unset-key (kbd "s-h"))
(global-unset-key (kbd "s-i"))
(global-unset-key (kbd "s-j"))
(global-unset-key (kbd "s-k"))
(global-unset-key (kbd "s-l"))
(global-unset-key (kbd "s-m"))
(global-unset-key (kbd "s-n"))
(global-unset-key (kbd "s-o"))
(global-unset-key (kbd "s-p"))
(global-unset-key (kbd "s-q"))
(global-unset-key (kbd "s-r"))
(global-unset-key (kbd "s-s"))
(global-unset-key (kbd "s-t"))
(global-unset-key (kbd "s-u"))
(global-unset-key (kbd "s-v"))
(global-unset-key (kbd "s-w"))
(global-unset-key (kbd "s-x"))
(global-unset-key (kbd "s-y"))
(global-unset-key (kbd "s-z"))
(global-unset-key (kbd "s--"))

;; -------------------------------------
;; Custom Key Bindings
;; -------------------------------------

(global-set-key (kbd "C-j") 'reindent-then-newline-and-indent)

(global-set-key (kbd "C-x r q") 'save-buffers-kill-terminal)
(global-unset-key (kbd "C-x C-c"))

;; unset some bindings for SizeUp
(global-unset-key (kbd "C-M-h")) ;; default - mark-defun
(global-unset-key (kbd "C-M-l")) ;; default - reposition-window

;; move between windows more quickly
(global-set-key (kbd "s-f") 'other-window)
(global-set-key (kbd "s-b") (kbd "C-u \- 1 s-f"))

;; stop minimizing the frame by mistake
(global-unset-key (kbd "C-x C-z"))
(global-unset-key (kbd "C-z"))

;; copy-line
(global-set-key (kbd "s-k") (kbd "C-k C-/"))

;; faster goto-line
(global-set-key (kbd "s-l") 'goto-line)

;; some minor modes
(global-set-key (kbd "A-l") 'linum-mode)
(global-set-key (kbd "A-v") 'visual-line-mode)

;; commenting quickly
(global-set-key (kbd "s-r s-c") 'comment-region)
(global-set-key (kbd "s-r s-u") 'uncomment-region)

;; replace faster
(global-unset-key (kbd "M-%"))
(global-set-key (kbd "s-r s-q") 'query-replace)
(global-set-key (kbd "s-r s-r") 'replace-rectangle)
(global-set-key (kbd "s-r s-s") 'replace-string)
(global-set-key (kbd "s-r s-x") 'replace-regexp)

;; yo dawg, I heard you like saving keystrokes with keyboard macros, so I bound
;; your macro commands to shorter keystrokes so you save keystrokes while you're
;; saving keystrokes
(global-set-key (kbd "s-9") 'kmacro-start-macro)
(global-set-key (kbd "s-0") 'kmacro-end-macro)
(global-set-key (kbd "s-e") 'kmacro-end-and-call-macro)

;; make C-h and M-h do what C-d and M-d do, but backward
(define-key key-translation-map [?\C-h] [?\C-?])
(global-set-key (kbd "M-h") 'backward-kill-word)

;; rebind the commands previously set to C-h and M-h
(global-set-key (kbd "M-p") 'mark-paragraph)
(global-set-key (kbd "C-?") 'help-command)

(global-set-key (kbd "s-x s-l") 'global-hl-line-mode)
(global-set-key (kbd "s-r s-b") 'revert-buffer)
(global-set-key (kbd "s-r s-d") 'rainbow-delimiters-mode)
(global-set-key (kbd "s-w s-s") 'whitespace-mode)
(global-set-key (kbd "s-r s-e") 'eval-region)

(global-set-key (kbd "C-=") 'er/expand-region)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(global-set-key (kbd "s-j")
                (lambda ()
                  (interactive)
                  (join-line -1)))

;; Move more quickly
(global-set-key (kbd "C-S-n")
                (lambda ()
                  (interactive)
                  (ignore-errors (next-line 5))))

(global-set-key (kbd "C-S-p")
                (lambda ()
                  (interactive)
                  (ignore-errors (previous-line 5))))

(global-set-key (kbd "C-S-f")
                (lambda ()
                  (interactive)
                  (ignore-errors (forward-char 5))))

(global-set-key (kbd "C-S-b")
                (lambda ()
                  (interactive)
                  (ignore-errors (backward-char 5))))

(global-set-key (kbd "C-c g") 'magit-status)



;; -------------------------------------
;; Parens
;; -------------------------------------

(show-paren-mode t)
(setq show-paren-delay 0)

(defadvice show-paren-function
      (after show-matching-paren-offscreen activate)
      "If the matching paren is offscreen, show the matching line in the
        echo area. Has no effect if the character before point is not of
        the syntax class ')'."
      (interactive)
      (let* ((cb (char-before (point)))
             (matching-text (and cb
                                 (char-equal (char-syntax cb) ?\) )
                                 (blink-matching-open))))
        (when matching-text (message matching-text))))

;; -------------------------------------
;; Dev
;; -------------------------------------

;; trailing whitespace is stupid
(setq-default show-trailing-whitespace t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq-default require-final-newline t)

(setq-default tab-width 2)

(defmacro rename-modeline (package-name mode new-name)
  `(eval-after-load ,package-name
     '(defadvice ,mode (after rename-modeline activate)
        (setq mode-name ,new-name))))

(setq-default fill-column 80)

;; -------------------------------------
;; Dired
;; -------------------------------------

(require 'dired-x)
(setq-default dired-omit-files-p t)
(setq dired-omit-files (concat dired-omit-files "\.pyc$"))

;; -------------------------------------
;; CSS
;; -------------------------------------

;; rainbow delimiters
(add-hook 'css-mode-hook 'rainbow-delimiters-mode)

(setq css-indent-offset 2)


;; -------------------------------------
;; Emacs Lisp
;; -------------------------------------

;; rainbow delimiters
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)

;; -------------------------------------
;; JavaScript
;; -------------------------------------

(require 'js2-jshint)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; auto-complete with ac-js2
(add-hook 'js2-mode-hook 'ac-js2-mode)
(setq ac-js2-evaluate-calls t)

;; normal js2-mode vars
(setq-default js2-basic-offset 2)
(setq-default js2-allow-keywords-as-property-names nil)
(setq js2-highlight-level 3)

;; js2-refactor
(js2r-add-keybindings-with-prefix "M-J")

;; Let flycheck/jshint handle parse errors
(setq-default js2-show-parse-errors nil)
(setq-default js2-strict-missing-semi-warning nil)
(setq-default js2-strict-trailing-comma-warning t) ;; jshint does not warn about this now for some reason
;;(add-hook 'js2-mode-hook (lambda () (flycheck-mode 1)))

;; use M-x helm-imenu to quickly jump to function definitions
(add-hook 'js2-mode-hook 'js2-imenu-extras-mode)

;; apply settings from .jshintrc to js2-mode
(add-hook 'js2-init-hook 'js2-jshint-setup)

;; rainbow delimiters
(add-hook 'js2-mode-hook 'rainbow-delimiters-mode)

;; -------------------------------------
;; JSON
;; -------------------------------------

(add-to-list 'auto-mode-alist '(".jshintrc" . json-mode))
(setq js-indent-level 2)
(add-hook 'json-mode-hook (lambda () (setq indent-tabs-mode nil)))

;; -------------------------------------
;; Python
;; -------------------------------------

;; rainbow delimiters
(add-hook 'python-mode-hook 'rainbow-delimiters-mode)

;; autocorrecting linter
(add-hook 'python-mode-hook
  (lambda()
    (add-hook 'write-contents-functions
      (lambda()
        (save-excursion
          (py-autopep8-before-save))))))

;; (add-hook 'before-save-hook 'py-autopep8-before-save)
(setq py-autopep8-options '("--max-line-length=100"))

;; (elpy-enable)
;; (when (require 'flycheck nil t)
;;   (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
;;   (add-hook 'elpy-mode-hook 'flycheck-mode))

;; -------------------------------------
;; Ruby
;; -------------------------------------

;; rainbow delimiters
(add-hook 'ruby-mode-hook 'rainbow-delimiters-mode)

;; autocorrecting linter
(add-hook 'ruby-mode-hook
  (lambda()
    (add-hook 'before-save-hook 'rubocop-autocorrect-current-file nil t)))

(setq ruby-deep-indent-paren nil)

(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile\\.lock$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))

(setq web-mode-markup-indent-offset 2)

;;; init.el ends here


(load-theme 'solarized-dark t)
