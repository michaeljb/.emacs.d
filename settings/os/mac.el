(setq mac-option-modifier 'alt)
(setq mac-command-modifier 'meta)
(setq ns-function-modifier 'hyper)

(setq delete-by-moving-to-trash t
      trash-directory "~/.Trash/emacs")

(cond ((equal 'ns window-system) (require 'mac-window))
      ((equal nil window-system) (require 'mac-terminal)))

(provide 'mac)
