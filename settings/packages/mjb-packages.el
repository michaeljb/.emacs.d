(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")))

(setq package-enable-at-startup nil)
(package-initialize)

(setq mjb-package-list '(
			 dash
			 expand-region
			 magit
			 rainbow-delimiters
			 smex
			 solarized-theme
			 ))

(cond ((string-match "^24." emacs-version) (require 'mjb-packages-emacs24))
      ((string-match "^25." emacs-version) (require 'mjb-packages-emacs25)))

(provide 'mjb-packages)
