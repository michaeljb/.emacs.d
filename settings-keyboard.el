;;;; MAC KEY SETTINGS
;; left Command is Meta
;; right Command is Super
;; Option is Alt
(setq mac-option-key-is-meta nil)
(setq mac-option-modifier 'alt)

(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-right-command-modifier 'super)

;; default behavior on Mac is for super to make emacs more Mac-like; super-key is similar to command-key in other Mac applications; get rid of these bindings
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

;;;; KEY BINDINGS

;; unset some bindings for SizeUp
(global-unset-key (kbd "C-M-h")) ;; default - mark-defun
(global-unset-key (kbd "C-M-l")) ;; default - reposition-window

;; move between windows more quickly
(global-set-key (kbd "s-f") 'other-window)
(global-set-key (kbd "s-b") (kbd "C-u \- 1 s-f"))

;; quick access to the minimap
(global-set-key (kbd "s-m s-c") 'minimap-create)
(global-set-key (kbd "s-m s-k") 'minimap-kill)

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

;; yo dawg, I heard you like saving keystrokes with macros, so I bound your macro commands to shorter keystrokes so you save keystrokes while you're saving keystrokes
(global-set-key (kbd "s-9") 'kmacro-start-macro)
(global-set-key (kbd "s-0") 'kmacro-end-macro)
(global-set-key (kbd "s-e") 'kmacro-end-and-call-macro)

;; rebind help to C-?
(global-set-key (kbd "C-?") 'help-command)

;; make C-h and M-h do what C-d and M-d do, but backward
(define-key key-translation-map [?\C-h] [?\C-?])
;; (global-unset-key (kbd "M-h"))
(global-set-key (kbd "M-h") 'backward-kill-word)

;; M-h is changed, but mark-paragraph is still nice to have
(global-set-key (kbd "M-p") 'mark-paragraph)

;; magit
(global-set-key (kbd "C-x g d") 'magit-diff-working-tree)
(global-set-key (kbd "C-x g s") 'magit-status)
(global-set-key (kbd "C-x g b") 'magit-branch-manager)

;; toggle column highlighting with vline-mode
(global-set-key (kbd "s-x s-v") 'vline-global-mode)

;; toggle row highlighting
(global-set-key (kbd "s-x s-l") 'global-hl-line-mode)

(global-unset-key (kbd "ESC ESC ESC"))


(global-set-key (kbd "s-r s-b") 'revert-buffer)

(global-set-key (kbd "s-w s-s") 'whitespace-mode)

(global-set-key (kbd "s-r s-d") 'rainbow-delimiters-mode)

(provide 'settings-keyboard)
