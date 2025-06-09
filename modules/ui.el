; UI
;; Font configuration
(set-face-attribute 'default nil :family amy/fixed-font-face :height amy/font-size)
(set-face-attribute 'fixed-pitch nil :family amy/fixed-font-face :height amy/font-size)
(set-face-attribute 'variable-pitch nil :family amy/variable-font-face :height amy/font-size)

;; Make Org-mode tables prettier
(use-package org-pretty-table
  :vc (:url "https://github.com/Fuco1/org-pretty-table")
  :hook org-mode
  :custom
  (org-pretty-table-charset "╭╮╰╯┬┤┴├┼─│"))

;; Smoooooooooth scrolling
(use-package ultra-scroll
  :vc (:url "https://github.com/jdtsmith/ultra-scroll")
  :init
  (setq scroll-conservatively 3
	scroll-margin 0)
  :config
  (ultra-scroll-mode 1))

;; Highlight modified regions 
(use-package goggles
  :diminish
  :hook ((prog-mode text-mode) . goggles-mode)
  :config
  (setq-default goggles-pulse t))
