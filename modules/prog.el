(use-package rainbow-delimiters
  :diminish
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package smartparens
  :diminish
  :hook (prog-mode text-mode org-mode)
  :config
  (require 'smartparens-config))

;; Automatically set up treesit-modes
(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

;; Licence templates
(use-package license-templates)
