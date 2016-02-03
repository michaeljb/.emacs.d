(defalias 'yes-or-no-p 'y-or-n-p)

(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

(setq echo-keystrokes 0.01)

(setq ring-bell-function (lambda () (message "*woop* *woop* *woop* *woop* *woop* *woop* *woop* *woop* *woop* *woop* *woop* *woop* *woop* *woop*")(sleep-for .15)))

(provide 'mjb-minibuffer)
