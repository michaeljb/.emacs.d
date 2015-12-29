(setq mac-option-modifier 'alt)
(setq mac-command-modifier 'meta)
(setq ns-function-modifier 'hyper)

(setq delete-by-moving-to-trash t
      trash-directory "~/.Trash/emacs")

(if (equal 'ns window-system)
    (require 'mac-window)
    (require 'mac-terminal))

(provide 'mac)
