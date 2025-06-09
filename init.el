;; Amy's minimal emacs configuration
;; Authored: Jun 9 2025

; Utilities
(defun amy/load-module (name)
  "Loads a configuration module. The argument NAME should be a valid module name
   in \"<user-emacs-directory>/modules/\"."
  (load (expand-file-name (symbol-name name) (concat user-emacs-directory "modules/"))))

;; Core configuration
(amy/load-module 'core)

;; Completion Module
(amy/load-module 'comp)

;; IDE Modules
(amy/load-module 'prog)
(amy/load-module 'lisp)

;; Text editing
(amy/load-module 'org)

; Visual Flair
(amy/load-module 'ui)
(amy/load-module 'theme)
