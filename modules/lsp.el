; LSP
(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook ((typescript-ts-mode . lsp)
	 (csharp-ts-mode . lsp)
	 (python-ts-mode . lsp))
  :commands lsp)

(use-package lsp-ui
  :after lsp-mode
  :custom
  (lsp-ui-sideline-show-diagnostics t)
  (lsp-ui-sideline-show-hover t))

(use-package flycheck
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))
