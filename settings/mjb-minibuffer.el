(defalias 'yes-or-no-p 'y-or-n-p)

(ido-mode)

(setq echo-keystrokes 0.1)

(setq ring-bell-function (lambda () (message "*woop* *woop* *woop* *woop* *woop* *woop* *woop* *woop* *woop* *woop* *woop* *woop* *woop* *woop*")(sleep-for .15)))

(provide 'mjb-minibuffer)
