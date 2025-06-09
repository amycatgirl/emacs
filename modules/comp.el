; Command/Keyword Completion
(use-package corfu
  :config
  (global-corfu-mode))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion)))))

;; Invoke corfu on tab
(setf tab-always-indent 'complete)

;; Disable Ispell's completion function
(setf text-mode-ispell-word-completion nil)

;; Hide commands that we can't run in our buffer
(setf read-extended-command-predicate #'command-completion-default-include-p)
