(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")))

(setq mjb-package-list '(
			 expand-region
			 magit
			 rainbow-delimiters
			 smex
			 ))

(cond ((string-match "^25." emacs-version) (require 'mjb-packages-emacs25)))

(provide 'mjb-packages)
