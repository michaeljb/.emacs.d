(defalias 'yes-or-no-p 'y-or-n-p)

(ido-mode)

(setq echo-keystrokes 0.01)

(setq ring-bell-function (lambda () (message "*woop* *woop* *woop* *woop* *woop* *woop* *woop* *woop* *woop* *woop* *woop* *woop* *woop* *woop* *woop* *woop* ")(sleep-for .15)))

(setq smex-save-file "~/.smex-items")

(provide 'mjb-minibuffer)
