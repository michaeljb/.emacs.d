(global-set-key (kbd "C-x C-b") 'ibuffer)

;; regex searching is best searching
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

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
(global-set-key (kbd "C-S-n") 'forward-five-lines)

(defun backward-five-lines ()
  (interactive)
  (ignore-errors (previous-line 5)))
(global-set-key (kbd "C-S-p") 'backward-five-lines)



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

;; multiple cursors
(defvar mjb-prefix-c (make-keymap))
(define-prefix-command 'mjb-prefix-c)
(define-key mjb-prefix "c" 'mjb-prefix-c)

(define-key mjb-prefix-c "c" 'mc/edit-lines)
(define-key mjb-prefix-c ">" 'mc/mark-next-like-this)
(define-key mjb-prefix-c "<" 'mc/mark-previous-like-this)

(global-set-key (kbd "C-c ,") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c r") 'set-rectangular-region-anchor)

(provide 'mjb-keybindings)
