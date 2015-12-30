(setq package-user-dir "~/.emacs.elpa")

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")))

(setq package-enable-at-startup nil)
(package-initialize)

(when (not (package-installed-p 'dash))
  (package-refresh-contents)
  (package-install 'dash))
(require 'dash)

(defvar mjb-package-list
  '(dash
    expand-region
    magit
    rainbow-delimiters
    smex
    zenburn-theme

    ;; python
    elpy
    nose
    py-autopep8
    pyvenv

    ;; puppet
    puppet-mode

    ;; yaml
    yaml-mode))

(cond ((string-match "^24." emacs-version) (require 'mjb-packages-emacs24))
      ((string-match "^25." emacs-version) (require 'mjb-packages-emacs25)))

(provide 'mjb-packages)
