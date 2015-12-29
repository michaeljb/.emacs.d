(cond ((or (equal 'darwin system-type) (memq (window-system) '(mac ns))) (require 'mjb-mac)))

(provide 'mjb-os)
