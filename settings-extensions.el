;; Edit with Emacs for Chrome
(require 'edit-server)
(edit-server-start)

;; DSVN
(autoload 'svn-status "dsvn" "Run `svn status'." t)
(autoload 'svn-update "dsvn" "Run `svn update'." t)
(require 'vc-svn)

(global-hl-line-mode 1)

(provide 'settings-extensions)
