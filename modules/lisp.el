; Lisp (requires prog module)
;; Clojure
(use-package clojure-mode
  :hook (clojure-mode . smartparens-strict-mode))
(use-package cider)

;; Common Lisp
(use-package slime
  :custom
  (inferior-lisp-program "sbcl") ;; Change this to your favourite CL flavour.
  :config
  (slime-setup '(slime-fancy)))
