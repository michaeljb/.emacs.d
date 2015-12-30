;; Write backup files to own directory, so we don't leave ~ files everywhere
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; backup files even when they're in version control
(setq vc-make-backup-files t)

(setq smex-save-file (concat user-emacs-directory ".smex-items"))
(setq ido-save-directory-list-file (concat user-emacs-directory ".ido.last"))

(provide 'mjb-filesystem)
