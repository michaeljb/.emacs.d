(global-set-key (kbd "C-x C-b") 'ibuffer)

;; regex searching is best searching
(global-set-key (kbd "C-s") 'phi-search)
(global-set-key (kbd "C-r") ''phi-search-backward)
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

(defun mjb/mc/mark-next-like-this-word (arg)
  (interactive "p")
  (mc/mark-next-like-this-word arg)
  (mjb-mc-map))

(defun mjb/mc/unmark-next-like-this ()
  (interactive)
  (mc/unmark-next-like-this)
  (mjb-mc-map))

(defun mjb/mc/skip-to-next-like-this ()
  (interactive)
  (mc/skip-to-next-like-this)
  (mjb-mc-map))

(defun mjb/mc/mark-previous-like-this (arg)
  (interactive "p")
  (mc/mark-previous-like-this arg)
  (mjb-mc-map))

(defun mjb/mc/unmark-previous-like-this ()
  (interactive)
  (mc/unmark-previous-like-this)
  (mjb-mc-map))

(defun mjb/mc/skip-to-previous-like-this ()
  (interactive)
  (mc/skip-to-previous-like-this)
  (mjb-mc-map))

(defun mjb/mc/mark-all-like-this ()
  (interactive)
  (mc/mark-all-like-this)
  (mjb-mc-map))

(defun mjb/mc/insert-numbers (arg num)
  (interactive (list (prefix-numeric-value current-prefix-arg)
		     (read-number "Starting number: " 0)))
  (mc/insert-numbers num)
  (mjb-mc-map))

(defun mjb/mc/sort-regions ()
  (interactive)
  (mc/sort-regions)
  (mjb-mc-map))

(defun mjb/mc/reverse-regions ()
  (interactive)
  (mc/reverse-regions)
  (mjb-mc-map))

(defun mjb/er/expand-region (arg)
  (interactive "p")
  (er/expand-region arg)
  (mjb-mc-map))

(defun mjb/mc/mark-pop ()
  (interactive)
  (mc/mark-pop)
  (mjb-mc-map))

(defun mjb/mc/mark-all-in-region-regexp (beg end)
  (interactive "r")
  (mc/mark-all-in-region-regexp beg end)
  (mjb-mc-map))

(defun mjb/mc/mark-next-lines (arg)
  (interactive "p")
  (mc/mark-next-lines arg)
  (mjb-mc-map))

(defun mjb/mc/mark-previous-lines (arg)
  (interactive "p")
  (mc/mark-previous-lines arg)
  (mjb-mc-map))

(defun mjb-mc-map ()
  (interactive)
  (set-transient-map
   (let ((map (make-sparse-keymap)))
     (define-key map ">" 'mjb/mc/mark-next-like-this-word)
     (define-key map "." 'mjb/mc/unmark-next-like-this)
     (define-key map "l" 'mjb/mc/skip-to-next-like-this)

     (define-key map "<" 'mjb/mc/mark-previous-like-this)
     (define-key map "," 'mjb/mc/unmark-previous-like-this)
     (define-key map "k" 'mjb/mc/skip-to-previous-like-this)

     (define-key map "a" 'mjb/mc/mark-all-like-this)

     (define-key map "1" 'mjb/mc/insert-numbers)

     (define-key map "s" 'mjb/mc/sort-regions)
     (define-key map "f" 'mjb/mc/reverse-regions)

     (define-key map " " 'mjb/mc/mark-pop)

     (define-key map "r" 'mjb/mc/mark-all-in-region-regexp)

     (define-key map "n" 'mjb/mc/mark-next-lines)
     (define-key map "p" 'mjb/mc/mark-previous-lines)

     (define-key map "(" 'mc/mark-sgml-tag-pair)
     (define-key map ")" 'mc/mark-sgml-tag-pair)

     (define-key map "C" 'mc/edit-lines)

     (define-key map "=" 'mjb/er/expand-region)

     (define-key map "R" 'set-rectangular-region-anchor)
     map)))

(global-set-key (kbd "M-C") 'mjb-mc-map)


(provide 'mjb-keybindings)
