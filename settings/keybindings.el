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

(global-set-key (kbd "A-l") 'linum-mode)

(provide 'keybindings)
