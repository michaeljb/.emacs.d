;; stolen from MHS and KWB

(require 'python)
(require 'elpy)
(require 'pyvenv)
(elpy-enable)

;; don't use flymake (elpy default), use flycheck
;; from: https://github.com/jorgenschaefer/elpy/issues/137
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; track virtual environments if they are set dir locally
(setq pyvenv-tracking-mode 't)

(add-hook 'python-mode-hook 'run-dev-hook)

;; Be able to run nose tests with various keybindings
(require 'nose)
(add-hook 'python-mode-hook
          (lambda ()
            (hack-local-variables)
            (when (boundp 'project-venv-name)
              (pyvenv-activate project-venv-name))
            (local-set-key "\C-ca" 'nosetests-all)
            (local-set-key "\C-cm" 'nosetests-module)
            (local-set-key "\C-c." 'nosetests-one)
            (local-set-key "\C-cpa" 'nosetests-pdb-all)
            (local-set-key "\C-cpm" 'nosetests-pdb-module)
            (local-set-key "\C-cp." 'nosetests-pdb-one)))

(provide 'mjb-python)
