;; stolen from KWB-emacs
;;----------------------

;; auto wrap, but only in comments
(defun local-comment-auto-fill ()
  (set (make-local-variable 'comment-auto-fill-only-comments) t)
  (auto-fill-mode t))

(defun show-rainbow-delimiters ()
  (rainbow-delimiters-mode t))

(defvar dev-hook nil
  "Hook that gets run on activation of any programming mode.")
(add-hook 'dev-hook 'local-comment-auto-fill)
(add-hook 'dev-hook 'show-rainbow-delimiters)

(defun run-dev-hook ()
  "Enable things that are convenient across all dev buffers."
  (run-hooks 'dev-hook))

(add-hook 'prog-mode-hook #'run-dev-hook)

(provide 'mjb-dev)
