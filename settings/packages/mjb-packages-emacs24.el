(when (not (package-installed-p 'dash))
  (package-refresh-contents)
  (package-install 'dash))
(require 'dash)

(defun packages-install (packages)
  (--each packages
    (when (not (package-installed-p it))
      (package-install it)))
    (delete-other-windows))

(packages-install mjb-package-list)

(provide 'mjb-packages-emacs24)
