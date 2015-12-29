(setq package-enable-at-startup nil)
(package-initialize)

(setq package-selected-packages mjb-package-list)

(package-install-selected-packages)
(package-autoremove)

(provide 'mjb-packages-emacs25)
