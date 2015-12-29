(setq settings-dir
      (expand-file-name "settings" user-emacs-directory))
(add-to-list 'load-path settings-dir)

(setq os-dir
      (expand-file-name "os" settings-dir))
(add-to-list 'load-path os-dir)

(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(setq inhibit-startup-screen t)

;; Write backup files to own directory, even when they're in version control
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))
(setq vc-make-backup-files t)

(require 'keybindings)

(when (or (equal 'darwin system-type) (memq (window-system) '(mac ns)))
  (require 'mac))

;; buffer

(set-fringe-mode 0)
(setq linum-format "%d ")

(setq shift-select-mode nil)

(global-set-key (kbd "C-S-n")
                (lambda ()
                  (interactive)
                  (ignore-errors (next-line 5))))

(global-set-key (kbd "C-S-p")
                (lambda ()
                  (interactive)
                  (ignore-errors (previous-line 5))))

(global-set-key (kbd "C-S-f")
                (lambda ()
                  (interactive)
                  (ignore-errors (forward-char 5))))

(global-set-key (kbd "C-S-b")
                (lambda ()
                  (interactive)
                  (ignore-errors (backward-char 5))))



;; modeline

(setq line-number-mode t)
(setq column-number-mode t)



;; mini-buffer

(defalias 'yes-or-no-p 'y-or-n-p)

(ido-mode)

(setq echo-keystrokes 0.01)

(setq ring-bell-function (lambda () (message "*woop* *woop* *woop* *woop* *woop* *woop* *woop* *woop* *woop* *woop* *woop* *woop* *woop* *woop* *woop* *woop* ")(sleep-for .15)))

