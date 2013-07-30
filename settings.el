
;; Auto refresh buffers
(global-auto-revert-mode 1)

;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; Add parts of each file's directory to the buffer name if not unique
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; javascript-mode
(setq js-indent-level 2)

;; Edit with Emacs for Chrome
(require 'edit-server)
(edit-server-start)

;; DSVN
(autoload 'svn-status "dsvn" "Run `svn status'." t)
(autoload 'svn-update "dsvn" "Run `svn update'." t)
(require 'vc-svn)

(global-hl-line-mode 1)

(setq desktop-dirname "~/")
(desktop-save-mode 1)

(setq ring-bell-function 'ignore)

(show-paren-mode t)

(provide 'settings)
