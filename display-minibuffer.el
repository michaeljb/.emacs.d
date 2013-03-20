;; use ido-mode, obviously
(require 'ido)
(ido-mode t)

;; echo keystrokes quickly
(setq echo-keystrokes 0.01)

;; Answering just 'y' or 'n' will do
(defalias 'yes-or-no-p 'y-or-n-p)

(provide 'display-minibuffer)
