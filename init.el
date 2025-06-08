;; Amy's minimal emacs configuration
;; Authored: Jun 8 2025

; Emacs configuration
;; Inhibit startup screen with the ugly logo and all
(setf inhibit-startup-screen t)

;; Move customization values elsewhere
(setf custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file t)

;; Disable toolbar
(tool-bar-mode -1)

;; Enable line numbers
(column-number-mode)
(global-display-line-numbers-mode t)

;; Highlight current line
(global-hl-line-mode 1)

;; Tab completions (needed for corfu)
(setf tab-always-indent 'complete)

;; Disable Ispell's completion function
(setf text-mode-ispell-word-completion nil)

;; Hide commands that we can't run in our buffer
(setf read-extended-command-predicate #'command-completion-default-include-p)

;; Disable scrollbar
(scroll-bar-mode -1)

;; Vertico extras
(setf context-menu-mode t
      enable-recursive-minibuffers t
      minibuffer-prompt-properties
      '(read-only t cursor-intangible t face minibuffer-prompt))
					       
;; Font configuration
;;; Constants
(defconst amy/font-size 130
  "IDE font size, shared between fixed and variable faces.")

(defconst amy/fixed-font-face "IBM Plex Mono"
  "IDE Monospaced/Fixed font. Used for code editing.")

(defconst amy/variable-font-face "IBM Plex Sans"
  "IDE Variable font. Used for text documents such as Org and Markdown files.")

;;; Font faces
(set-face-attribute 'default nil :family amy/fixed-font-face :height amy/font-size)
(set-face-attribute 'fixed-pitch nil :family amy/fixed-font-face :height amy/font-size)
(set-face-attribute 'variable-pitch nil :family amy/variable-font-face :height amy/font-size)

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

;;; Load use-package macro
(require 'use-package)

;;; Always ensure we pull in from our package sources
(setf use-package-always-ensure t)

;; Diminish (to remove certain minor modes from our status line)
(use-package diminish)

;; Minibuffer improvements
(use-package vertico
  :custom
  (vertico-cycle t)
  :init
  (vertico-mode))

(use-package savehist
  :init
  (savehist-mode))

(use-package marginalia
  :init
  (marginalia-mode))

;; Orderless Completion
(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion)))))

;; Installing basic packages for programming work
(use-package corfu
  :config
  (global-corfu-mode))

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

;; Smoooooooooth scrolling
(use-package ultra-scroll
  :vc (:url "https://github.com/jdtsmith/ultra-scroll")
  :init
  (setq scroll-conservatively 3
	scroll-margin 0)
  :config
  (ultra-scroll-mode 1))

;; Highligh modified regions 
(use-package goggles
  :diminish
  :hook ((prog-mode text-mode) . goggles-mode)
  :config
  (setq-default goggles-pulse t))

;;; Clojure
(use-package clojure-mode
  :hook (clojure-mode . smartparens-strict-mode))

(use-package cider)

;; Org Mode
(defun amy/org-setup ()
  (org-indent-mode)
  (visual-line-mode 1)
  (variable-pitch-mode 1))

;;; Use variable font on org files. 
(defun amy/org-font-faces ()
  ;; Replace list hyphen with dot
  (font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

  ;; Set faces for heading levels
  (dolist (face '((org-level-1 . 1.2)
                  (org-level-2 . 1.1)
                  (org-level-3 . 1.05)
                  (org-level-4 . 1.0)
                  (org-level-5 . 1.1)
                  (org-level-6 . 1.1)
                  (org-level-7 . 1.1)
                  (org-level-8 . 1.1)
		  (org-document-title . 1.5)))
    (set-face-attribute (car face) nil :font amy/variable-font-face :weight 'regular :height (cdr face)))

  ;; Ensure that anything that should be fixed-pitch in Org files appears that way
  (set-face-attribute 'org-block nil    :foreground nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-table nil    :inherit 'fixed-pitch)
  (set-face-attribute 'org-formula nil  :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil     :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-table nil    :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-checkbox nil  :inherit 'fixed-pitch)
  (set-face-attribute 'line-number nil :inherit 'fixed-pitch)
  (set-face-attribute 'line-number-current-line nil :inherit 'fixed-pitch))

(use-package org
  :pin gnu
  :hook (org-mode . amy/org-setup)
  :custom
  (org-hide-emphasis-markers t)
  :config
  (amy/org-font-faces))

;;; Make tables prettier
(use-package org-pretty-table
  :vc (:url "https://github.com/Fuco1/org-pretty-table")
  :hook org-mode
  :custom
  (org-pretty-table-charset "╭╮╰╯┬┤┴├┼─│"))

;; Theme
(use-package inkpot-theme
  :config
  (load-theme 'inkpot))
