;; Configure the org-mode buffer
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
    (set-face-attribute (car face) nil :font amy/variable-font-face :weight 'semi-bold :height (cdr face)))

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


(defun amy/org-babel-setup ()
  (require 'org-tempo) ;; Load org Templates
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((bash . t)
     (clojure . t)
     (js . t)
     (elisp . t)
     (lisp . t)))
  )

(use-package org
  :pin gnu
  :hook (org-mode . amy/org-setup)
  :custom
  (org-hide-emphasis-markers t)
  :config
  (amy/org-font-faces)
  (amy/org-babel-setup))
