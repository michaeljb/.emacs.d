(setq package-user-dir "~/.emacs.elpa")

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")))

(setq package-enable-at-startup nil)
(package-initialize)

(defvar mjb-package-list
  '(
    ag
    csv-mode
    dash
    ein
    expand-region
    hide-comnt
    magit
    multiple-cursors
    phi-search
    projectile
    rainbow-delimiters
    smex
    wc-mode
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

;; install the packages, dependent on the Emacs version
(require 'mjb-install-packages)

(provide 'mjb-packages)
