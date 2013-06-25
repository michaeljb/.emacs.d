(tool-bar-mode -1)
(scroll-bar-mode -1)

;; use ido-mode, obviously
(require 'ido)
(ido-mode t)

;; echo keystrokes quickly
(setq echo-keystrokes 0.01)

;; Answering just 'y' or 'n' will do
(defalias 'yes-or-no-p 'y-or-n-p)

(setq line-number-mode t)
(setq column-number-mode t)


;; '(custom-enabled-themes (quote (zenburn)))
;; '(custom-safe-themes (quote ("27470eddcaeb3507eca2760710cc7c43f1b53854372592a3afa008268bcf7a75" default)))

(set-fringe-mode 0)
(setq linum-format "%d ")
(setq minimap-window-location 'right)

(global-hl-line-mode 1)

(provide 'display)
