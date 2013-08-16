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
    edit-server
    flycheck
    flycheck-color-mode-line
    google-this
    hl-line+
    jade-mode
    js2-mode
    js2-refactor
    magit
    man-commands
    markdown-mode
    rainbow-delimiters
    rubocop
    solarized-theme
    yasnippet))

(mapc #'(lambda (package)
         (unless (package-installed-p package)
           (package-install package)))
      mjb-packages)

;; -------------------------------------
;; General stuff
;; -------------------------------------

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Auto refresh buffers
(global-auto-revert-mode 1)

;; Add parts of each file's directory to the buffer name if not unique
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; Edit with Emacs for Chrome
(require 'edit-server)
(edit-server-start)

;; Session Saving
(setq desktop-dirname "~/")
(desktop-save-mode 1)

(tool-bar-mode -1)
(scroll-bar-mode -1)

(require 'ido)
(ido-mode t)

;; echo keystrokes quickly
(setq echo-keystrokes 0.01)

;; Answering just 'y' or 'n' will do
(defalias 'yes-or-no-p 'y-or-n-p)

(setq line-number-mode t)
(setq column-number-mode t)

(set-fringe-mode 0)
(setq linum-format "%d ")

(global-hl-line-mode 1)

(setq ring-bell-function 'ignore)

(show-paren-mode t)

(load-theme 'solarized-dark)

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

;; replace-faster
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

;; use ibuffer instead of the normal buffer
(global-unset-key (kbd "C-x C-b"))
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; -------------------------------------
;; Dev
;; -------------------------------------

(global-set-key (kbd "C-j") 'reindent-then-newline-and-indent)

;; use spaces instead of tabs, obviously
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;; don't let the trailing whitespace hide
(setq-default show-trailing-whitespace t)

(defun add-line-numbers ()
  (linum-mode 1))

(require 'auto-complete)
(defun add-auto-complete ()
  (auto-complete-mode 1))

(defun dev-before-save-hook ()
  (add-hook 'before-save-hook 'delete-trailing-whitespace))

(defvar dev-hook nil
  "Hook that gets run on activation of any programming mode.")
(add-hook 'dev-hook 'add-line-numbers)
(add-hook 'dev-hook 'add-auto-complete)
(add-hook 'dev-hook 'dev-before-save-hook)

(defun run-dev-hook ()
  "Enable things that are convenient across all dev buffers."
  (interactive)
  (run-hooks 'dev-hook))

(yas-global-mode 1)


(defvar dev-mode-hooks
  '(emacs-lisp-mode-hook
    ruby-mode-hook
    js2-mode-hook))

(mapc #'(lambda (mode-hook)
         (add-hook mode-hook 'run-dev-hook))
      dev-mode-hooks)

;; -------------------------------------
;; Ruby
;; -------------------------------------
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile.lock$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))

;; -------------------------------------
;; JavaScript
;; -------------------------------------
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(setq-default js2-basic-offset 2)
