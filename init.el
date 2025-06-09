;; Amy's minimal emacs configuration
;; Authored: Jun 9 2025

(defvar amy/loaded-modules nil
  "Modules that have been loaded.")

; Utilities
(defun amy/load-module (name)
  "Load a configuration module.  The argument NAME should be a valid module name
   in \"<user-emacs-directory>/modules/\"."
  (unless (member name amy/loaded-modules)
    (load (expand-file-name (symbol-name name) (concat user-emacs-directory "modules/")))
    (push name amy/loaded-modules)))

;; Core configuration
(amy/load-module 'core)

;; Completion Module
(amy/load-module 'comp)

;; IDE Modules
(amy/load-module 'prog)
(amy/load-module 'lisp)
(amy/load-module 'lsp)
(amy/load-module 'term)
(amy/load-module 'git)

;; Text editing
(amy/load-module 'org)

; Visual Flair
(amy/load-module 'ui)
(amy/load-module 'theme)
