(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "C-c l") 'linum-mode)

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


(defun delete-other-windows-y-n ()
  (interactive)
  (if (or (< (count-windows) 4)
          (y-or-n-p "Delete all other windows?"))
      (delete-other-windows)))
(global-set-key (kbd "C-x 1") 'delete-other-windows-y-n)

;; --------------------------------------------------
;; Key Bindings with my own prefix
;; --------------------------------------------------

(defvar mjb-prefix (make-keymap))
(define-prefix-command 'mjb-prefix)
(global-set-key (kbd "C-c C") 'mjb-prefix)
(defvar mjb-prefix-r (make-keymap))
(define-prefix-command 'mjb-prefix-r)
(define-key mjb-prefix "r" 'mjb-prefix-r)

(define-key mjb-prefix-r "r"	'replace-rectangle)
(define-key mjb-prefix-r "x"	'query-replace-regexp)

(define-key mjb-prefix-r "c"	'comment-region)
(define-key mjb-prefix-r "u"	'uncomment-region)

(define-key mjb-prefix-r "b"	'revert-buffer)

(define-key mjb-prefix "j"
                (lambda ()
                  (interactive)
                  (join-line -1)))


(provide 'mjb-keybindings)
