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
  '(ag
    csv-mode
    dash
    expand-region
    magit
    multiple-cursors
    phi-search
    projectile
    rainbow-delimiters
    smex
    wgrep
    wgrep-ag
    zenburn-theme

    ;; gherkin
    feature-mode

    ;; markdown
    markdown-mode

    ;; puppet
    puppet-mode

    ;; python
    elpy
    nose
    py-autopep8
    pyvenv

    ;; yaml
    yaml-mode))

(cond ((string-match "^24." emacs-version) (require 'mjb-packages-emacs24))
      ((string-match "^25." emacs-version) (require 'mjb-packages-emacs25)))

(provide 'mjb-packages)
