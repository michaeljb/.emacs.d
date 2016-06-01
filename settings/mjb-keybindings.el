(global-set-key (kbd "C-x C-b") 'ibuffer)

;; regex searching is best searching
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; search compatible with multiple cursors
(global-set-key (kbd "M-s M-s") 'phi-search)
(global-set-key (kbd "M-s s") 'phi-search)

;; less accidental quitting
(global-set-key (kbd "C-x r q") 'save-buffers-kill-terminal)
(global-unset-key (kbd "C-x C-c"))

;; define keyboard macros faster
(global-set-key (kbd "M-9") 'kmacro-start-macro)
(global-set-key (kbd "M-0") 'kmacro-end-macro)

;; make C-h and M-h do what C-d and M-d do, but backward
(define-key key-translation-map [?\C-h] [?\C-?])
(global-set-key (kbd "M-h") 'backward-kill-word)

;; rebind the commands previously set to C-h and M-h
(global-set-key (kbd "M-p") 'mark-paragraph)
(global-set-key (kbd "C-?") 'help-command)

(defun forward-five-lines ()
  (interactive)
  (ignore-errors (next-line 5)))
(global-set-key (kbd "M-N") 'forward-five-lines)

(defun backward-five-lines ()
  (interactive)
  (ignore-errors (previous-line 5)))
(global-set-key (kbd "M-P") 'backward-five-lines)

(defun forward-five-chars ()
  (interactive)
  (ignore-errors (forward-char 5)))
(global-set-key (kbd "M-F") 'forward-five-chars)

(defun backward-five-chars ()
  (interactive)
  (ignore-errors (backward-char 5)))
(global-set-key (kbd "M-B") 'backward-five-chars)


;; --------------------------------------------------
;; Key Bindings for Installed Packages
;; --------------------------------------------------

(global-set-key (kbd "C-=") 'er/expand-region)

(global-set-key (kbd "C-c g") 'magit-status)

(global-set-key "\C-x\C-m" 'smex)
(global-set-key "\C-c\C-m" 'smex)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(global-set-key (kbd "C-x /") 'hide/show-comments-toggle)


;; --------------------------------------------------
;; Key Bindings with my own prefix
;; --------------------------------------------------

(defvar mjb-prefix (make-keymap))
(define-prefix-command 'mjb-prefix)
(global-set-key (kbd "C-M-m") 'mjb-prefix)
(defvar mjb-prefix-r (make-keymap))
(define-prefix-command 'mjb-prefix-r)
(define-key mjb-prefix "r" 'mjb-prefix-r)


(define-key mjb-prefix "l"	'linum-mode)

(define-key mjb-prefix "n"	'forward-five-lines)
(define-key mjb-prefix "p"	'backward-five-lines)

(define-key mjb-prefix "w"	'delete-trailing-whitespace)

(define-key mjb-prefix "="	'er/expand-region)

(define-key mjb-prefix-r "r"	'replace-rectangle)
(define-key mjb-prefix-r "x"	'query-replace-regexp)

(define-key mjb-prefix-r "c"	'comment-region)
(define-key mjb-prefix-r "u"	'uncomment-region)

(define-key mjb-prefix-r "b"	'revert-buffer)

(define-key mjb-prefix "j"
                (lambda ()
                  (interactive)
                  (join-line -1)))


;; --------------------------------------------------
;; Multiple Cursors
;; --------------------------------------------------

(require 'mc-cycle-cursors)

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

  ("q" nil))

(global-set-key (kbd "M-C") 'hydra-mjb-mc/body)

(provide 'mjb-keybindings)
