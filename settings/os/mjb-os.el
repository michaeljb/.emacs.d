(if (equal nil window-system)
    (require 'mjb-global-terminal)
  (require 'mjb-global-window))

(cond ((or (equal 'darwin system-type) (memq (window-system) '(mac ns)))
       (require 'mjb-mac))

      ((equal 'gnu/linux system-type)
       (require 'mjb-linux)))

(provide 'mjb-os)
