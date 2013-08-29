;;; init --- michaeljb emacs configuration
;;; Commentary:

;; "Emacs is undoubtedly the most powerful programmer's editor in existence."
;; - Eric S. Raymond, "The Art of UNIX Programming"

;;; Code:
(setq inhibit-startup-screen t)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; -------------------------------------
;; Packages
;; -------------------------------------

(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

(package-initialize)

(defvar mjb-packages
  '(auto-complete
    better-defaults
    dash
    diminish
    edit-server
    exec-path-from-shell
    expand-region
    flycheck
    flycheck-color-mode-line
    google-this
    hl-line+
    jade-mode
    js2-mode
    js2-refactor
    json-mode
    magit
    man-commands
    markdown-mode
    multiple-cursors
    paredit
    rainbow-delimiters
    rvm
    solarized-theme
    yasnippet
    yaml-mode))

(dolist (p mjb-packages)
  (when (not (package-installed-p p))
    (package-install p)))


;; -------------------------------------
;; Display stuff
;; -------------------------------------

(load-theme 'solarized-dark)

(set-fringe-mode 0)
(setq linum-format "%d ")


;; -------------------------------------
;; General stuff
;; -------------------------------------

(exec-path-from-shell-initialize)

(global-rainbow-delimiters-mode)

;; Auto refresh buffers
(global-auto-revert-mode 1)

;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; Edit with Emacs for Chrome
(require 'edit-server)
(edit-server-start)

;; Session Saving
(setq desktop-dirname user-emacs-directory)
(desktop-save-mode t)

(require 'ido)
(ido-mode t)

;; echo keystrokes quickly
(setq echo-keystrokes 0.01)

;; Answering just 'y' or 'n' will do
(defalias 'yes-or-no-p 'y-or-n-p)

(setq line-number-mode t)
(setq column-number-mode t)

(setq ring-bell-function 'ignore)

(global-hl-line-mode 1)

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

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

(setq-default require-final-newline t)

;; my escape key is broken, getting it back in place results in unwanted closing of windows
(global-unset-key (kbd "ESC ESC ESC"))

;; Real emacs knights don't use shift to mark things
(setq shift-select-mode nil)


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

;; yo dawg, I heard you like saving keystrokes with keyboard macros, so I bound your macro commands to shorter keystrokes so you save keystrokes while you're saving keystrokes
(global-set-key (kbd "s-9") 'kmacro-start-macro)
(global-set-key (kbd "s-0") 'kmacro-end-macro)
(global-set-key (kbd "s-e") 'kmacro-end-and-call-macro)

;; make C-h and M-h do what C-d and M-d do, but backward
(define-key key-translation-map [?\C-h] [?\C-?])
(global-set-key (kbd "M-h") 'backward-kill-word)

;; rebind the commands previously set to C-h and M-h
(global-set-key (kbd "M-p") 'mark-paragraph)
(global-set-key (kbd "C-?") 'help-command)

;; toggle row highlighting
(global-set-key (kbd "s-x s-l") 'global-hl-line-mode)

;; quickly reload from disk
(global-set-key (kbd "s-r s-b") 'revert-buffer)

(global-set-key (kbd "s-r s-d") 'rainbow-delimiters-mode)

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

;; -------------------------------------
;; Dev
;; -------------------------------------

(global-set-key (kbd "C-=") 'er/expand-region)

(yas-global-mode 1)
(diminish 'yas-minor-mode)

;; don't let the trailing whitespace hide
(setq-default show-trailing-whitespace t)

(defun set-width ()
  (setq-default tab-width 2))

(defun add-line-numbers ()
  (linum-mode 1))

(require 'auto-complete)
(defun add-auto-complete ()
  (auto-complete-mode 1)
  (diminish 'auto-complete-mode))

(defun dev-before-save-hook ()
  (add-hook 'before-save-hook 'delete-trailing-whitespace))

(defun run-paredit ()
  (paredit-mode)
  (diminish 'paredit-mode))

;; magnars flycheck settings
(defun magnars/adjust-flycheck-automatic-syntax-eagerness ()
  "Adjust how often we check for errors based on if there are any.

This lets us fix any errors as quickly as possible, but in a
clean buffer we're an order of magnitude laxer about checking."
  (setq flycheck-idle-change-delay
        (if flycheck-current-errors 0.5 5.0)))

;; Each buffer gets its own idle-change-delay because of the
;; buffer-sensitive adjustment above.
(make-variable-buffer-local 'flycheck-idle-change-delay)

(add-hook 'flycheck-after-syntax-check-hook
          'magnars/adjust-flycheck-automatic-syntax-eagerness)

(require 'flycheck-color-mode-line)
(eval-after-load "flycheck"
  '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))

(defun run-flycheck ()
  (flycheck-mode)
  (diminish 'flycheck-mode))

(defvar dev-hook nil
  "Hook that gets run on activation of any programming mode.")
(add-hook 'dev-hook 'set-width)
(add-hook 'dev-hook 'add-line-numbers)
(add-hook 'dev-hook 'add-auto-complete)
(add-hook 'dev-hook 'dev-before-save-hook)
(add-hook 'dev-hook 'run-paredit)
(add-hook 'dev-hook 'run-flycheck)

(defun run-dev-hook ()
  "Enable things that are convenient across all dev buffers."
  (interactive)
  (run-hooks 'dev-hook))

(defvar dev-mode-hooks
  '(emacs-lisp-mode-hook
    js2-mode-hook
    json-mode-hook
    python-mode-hook
    ruby-mode-hook
    yaml-mode-hook))

(dolist (h dev-mode-hooks)
  (add-hook h 'run-dev-hook))

(defmacro rename-modeline (package-name mode new-name)
  `(eval-after-load ,package-name
     '(defadvice ,mode (after rename-modeline activate)
        (setq mode-name ,new-name))))

;; -------------------------------------
;; JavaScript
;; -------------------------------------

(require 'js2-refactor)

(rename-modeline "js2-mode" js2-mode "js2")

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(setq-default js2-basic-offset 2)
(setq-default js2-allow-keywords-as-property-names nil)

;; Let flycheck handle parse errors
(setq-default js2-show-parse-errors nil)
(setq-default js2-strict-missing-semi-warning nil)
(setq-default js2-strict-trailing-comma-warning t) ;; jshint does not warn about this now for some reason

;; jasmine and specit keywords
(defvar spec-globals
  '("afterEach" "after" "assert" "be" "before" "beforeEach" "describe" "eql"
    "expect" "it" "jasmine" "runs" "should" "sinon" "spyOn" "waitsFor"
    "xdescribe" "xit" "requireMock"))

;; jQuery, require, underscore
(defvar library-globals
  '("$" "_" "Backbone" "define" "jQuery" "module"))

(setq-default js2-global-externs (append spec-globals library-globals))


;; -------------------------------------
;; Ruby
;; -------------------------------------

(rvm-use-default)

(setq ruby-deep-indent-paren nil)

(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile\\.lock$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))

;;; init.el ends here
