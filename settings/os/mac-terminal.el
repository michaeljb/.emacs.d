(defun paste-from-clipboard ()
  (shell-command-to-string "pbpaste"))

(defun copy-to-clipboard (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function 'copy-to-clipboard)
(setq interprogram-paste-function 'paste-from-clipboard)

(provide 'mac-terminal)
