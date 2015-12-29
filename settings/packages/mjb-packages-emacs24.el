(defun packages-install (packages)
  (--each packages
    (when (not (package-installed-p it))
      (package-install it)))
    (delete-other-windows))

(packages-install mjb-package-list)

(provide 'mjb-packages-emacs24)
