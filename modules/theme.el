(use-package catppuccin-theme
  :init
  (setq catppuccin-flavor 'macchiato)
  :hook (after-init . (lambda ()
			(load-theme 'catppuccin))))
