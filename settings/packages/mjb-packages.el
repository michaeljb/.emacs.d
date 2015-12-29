(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")))

(setq mjb-package-list '(
			 expand-region
			 magit
			 smex
			 ))

(cond (t (require 'mjb-packages-emacs25)))

(provide 'mjb-packages)
