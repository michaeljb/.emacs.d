(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(css-indent-offset 2)
 '(fill-column 80)
 '(ido-case-fold t)
 '(ignored-local-variable-values '((whitespace-line-column 100)))
 '(js-indent-level 2)
 '(line-number-mode t)
 '(magit-diff-refine-hunk 'all)
 '(magit-fetch-arguments '("--prune"))
 '(magit-refresh-status-buffer nil)
 '(magit-status-sections-hook
   '(magit-insert-status-headers magit-insert-merge-log
                                 magit-insert-rebase-sequence
                                 magit-insert-am-sequence
                                 magit-insert-sequencer-sequence
                                 magit-insert-bisect-output
                                 magit-insert-bisect-rest
                                 magit-insert-bisect-log
                                 magit-insert-untracked-files
                                 magit-insert-unstaged-changes
                                 magit-insert-staged-changes
                                 magit-insert-stashes
                                 magit-insert-unpulled-from-upstream
                                 magit-insert-unpulled-from-pushremote
                                 magit-insert-unpushed-to-pushremote
                                 magit-insert-unpushed-to-upstream))
 '(org-clock-persist-file "~/.emacs.d/.org-clock-save.el")
 '(package-selected-packages
   '(ace-window ag bool-flip counsel csv-mode dockerfile-mode ein expand-region
                feature-mode flycheck git-timemachine hydra ivy-hydra js2-mode
                json-mode json-reformat magit magit-gh-pulls markdown-mode
                multi-vterm multiple-cursors phi-search php-mode puppet-mode
                py-isort rainbow-delimiters rjsx-mode smex tide use-package
                vterm wc-mode web-mode wgrep which-key winnow yaml-mode
                zenburn-theme))
 '(safe-local-variable-values '((whitespace-line-column 100) (encoding . utf-8)))
 '(typescript-indent-level 2)
 '(uniquify-buffer-name-style 'forward nil (uniquify))
 '(web-mode-code-indent-offset 2)
 '(web-mode-markup-indent-offset 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ein:cell-input-area ((t (:background "color-239"))))
 '(magit-diff-added ((t (:extend t :background "#284F28"))))
 '(magit-diff-added-highlight ((t (:extend t :background "#284F28"))))
 '(magit-diff-removed ((t (:extend t :background "#8C5353"))))
 '(magit-diff-removed-highlight ((t (:extend t :background "#8C5353"))))
 '(region ((t (:background "black" :distant-foreground "black")))))
