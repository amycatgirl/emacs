;; Amy's minimal emacs configuration
;; Authored: 7/06/2025

; Emacs configuration
;; Disable toolbar
(tool-bar-mode -1)

;; Enable line numbers
(setf display-line-numbers 'relative)
(display-line-numbers-mode 1)

;; Highlight current line
(global-hl-line-mode 1)

;; Tab completions (needed for corfu)
(setf tab-always-indent 'complete)

;; Disable Ispell's completion function
(setf text-mode-ispell-word-completion nil)

;; Hide commands that we can't run in our buffer
(setf read-extended-command-predicate #'command-completion-default-include-p)

; Extra packages
;; Setup package.el
(require 'package)
;;; Add melpa as a package source
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

;;; Initialize package.el and refresh sources
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

;;; Pull in use-package (if not present) and set it up
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)

;;; Always ensure we pull in from our package sources
(setf use-package-always-ensure t)

;; Installing basic packages for programming work

(use-package corfu
  :config
  (global-corfu-mode))


(use-package cider)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
