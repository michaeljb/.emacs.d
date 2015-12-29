(setq package-enable-at-startup nil)
(package-initialize)

(setq package-selected-packages '(
				  magit
				  ))

(package-install-selected-packages)
(package-autoremove)

(provide 'mjb-packages-emacs25)
