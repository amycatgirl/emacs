(use-package rainbow-delimiters
  :diminish
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package smartparens
  :diminish
  :hook (prog-mode text-mode org-mode)
  :config
  (require 'smartparens-config))

;; Licence templates
(use-package license-templates)
