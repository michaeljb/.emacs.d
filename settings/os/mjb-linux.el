(defun mjb-env/install-ag ()
  (when (not (eq 0 (shell-command "which ag")))
    (when (eq 0 (shell-command "which apt-get"))
      (shell-command "sudo apt-get install -y silversearcher-ag"))))
(mjb-env/install-ag)

(provide 'mjb-linux)
