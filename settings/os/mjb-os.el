(if (equal nil window-system)
    (require 'mjb-global-terminal)
  (require 'mjb-global-window))

(cond ((or (equal 'darwin system-type) (memq (window-system) '(mac ns))) (require 'mjb-mac)))

(provide 'mjb-os)
