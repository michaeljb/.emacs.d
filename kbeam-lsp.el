;; Python
(use-package lsp-python-ms
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-python-ms)
                          (lsp))))
(use-package pyvenv
  :ensure t
  :hook (python-mode . pyvenv-mode))
(use-package blacken
  :ensure t
  :pin melpa
  :hook (python-mode . blacken-mode))
;; -------------------------------------
;; Language Server Protocol
;; -------------------------------------
(use-package lsp-mode
  :ensure t
  :hook (python-mode . lsp)
  :commands lsp)
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)
(use-package company-lsp
  :ensure t
  :commands company-lsp)
(use-package dap-mode
  :ensure t
  :config
  (dap-mode 1)
  (dap-ui-mode 1)
  (dap-tooltip-mode 1)
  (tooltip-mode 1))
(use-package dap-python)
