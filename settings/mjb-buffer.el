;; generic buffer settings

(set-fringe-mode 0)
(setq linum-format "%d ")

(setq shift-select-mode nil)

(show-paren-mode t)
(setq show-paren-delay 0)
(defadvice show-paren-function
      (after show-matching-paren-offscreen activate)
      "If the matching paren is offscreen, show the matching line in the
        echo area. Has no effect if the character before point is not of
        the syntax class ')'."
      (interactive)
      (let* ((cb (char-before (point)))
             (matching-text (and cb
                                 (char-equal (char-syntax cb) ?\) )
                                 (blink-matching-open))))
        (when matching-text (message matching-text))))

(global-hl-line-mode)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq-default show-trailing-whitespace t)

(provide 'mjb-buffer)
