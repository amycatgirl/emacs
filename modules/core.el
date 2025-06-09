; Core
;; UI configuration
(defconst amy/font-size 130
  "IDE font size, shared between fixed and variable faces.")

(defconst amy/fixed-font-face "IBM Plex Mono"
  "IDE Monospaced/Fixed font. Used for code editing.")

(defconst amy/variable-font-face "IBM Plex Sans"
  "IDE Variable font. Used for text documents such as Org and Markdown files.")

;;; Disable toolbar
(tool-bar-mode -1)

;;; Enable line numbers
(column-number-mode)
(global-display-line-numbers-mode t)

;;; Highlight current line
(global-hl-line-mode 1)

;;; Disable scrollbar
(scroll-bar-mode -1)	        

;; Inhibit startup screen with the ugly logo and all
(setf inhibit-startup-screen t)

;; Package Manager
(require 'package)

;;; Add melpa as a package source
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

;; Move customization values elsewhere
(setf custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file t)


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

;; Less garbage :)
(use-package no-littering)

;; Automatic package updates
(use-package auto-package-update
  :custom
  (auto-package-update-interval 7)
  (auto-package-update-prompt-before-update t)
  (auto-package-update-hide-results t)
  :config
  (auto-package-update-maybe)
  (auto-package-update-at-time "09:00"))

;; Vertico recommendations
(setf context-menu-mode t
      enable-recursive-minibuffers t
      minibuffer-prompt-properties
      '(read-only t cursor-intangible t face minibuffer-prompt))

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
