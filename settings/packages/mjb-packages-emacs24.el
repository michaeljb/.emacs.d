(defun packages-install (packages)
  (--each packages
    (when (not (package-installed-p it))
      (package-install it)))
    (delete-other-windows))

(packages-install package-selected-packages)

(provide 'mjb-packages-emacs24)
