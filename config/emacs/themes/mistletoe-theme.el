;;; mistletoe-theme.el --- Mistletoe theme for Emacs -*- lexical-binding: t; -*-

(load-file "~/.config/emacs/themes/palette.el")

(deftheme mistletoe "A Mistletoe theme.")

;; Helper for palette lookup
(defun mistletoe-color (name)
  (cdr (assoc name mistletoe-colors)))

;; Define faces
(custom-theme-set-faces
 'mistletoe
 `(default ((t (:background ,(mistletoe-color 'base)
                :foreground ,(mistletoe-color 'text)))))
 `(cursor ((t (:background ,(mistletoe-color 'teal)))))
 `(mode-line ((t (:background ,(mistletoe-color 'mantle)
                  :foreground ,(mistletoe-color 'text)))))
 `(mode-line-inactive ((t (:background ,(mistletoe-color 'crust)
				                   :foreground ,(mistletoe-color 'overlay0)))))
 `(mode-line-buffer-id ((t (:foreground ,(mistletoe-color 'orange)))))
 `(fringe ((t (:background ,(mistletoe-color 'base)
			   :foreground ,(mistletoe-color 'surface1)))))
 `(vertical-border ((t (:foreground ,(mistletoe-color 'teal)))))
 `(minibuffer-prompt ((t (:foreground ,(mistletoe-color 'teal)))))
 `(link ((t (:foreground ,(mistletoe-color 'teal)))))
 `(line-number ((t (:foreground ,(mistletoe-color 'surface1)))))
 `(line-number-current-line ((t (:foreground ,(mistletoe-color 'teal)))))
 `(shadow ((t (:foreground ,(mistletoe-color 'overlay1)))))
 `(success ((t (:foreground ,(mistletoe-color 'green)))))
 `(warning ((t (:foreground ,(mistletoe-color 'yellow)))))
 `(error ((t (:foreground ,(mistletoe-color 'red)))))
 `(match ((t (:background ,(mistletoe-color 'surface1)
              :foreground ,(mistletoe-color 'teal)))))
 `(secondary-selection ((t (:background ,(mistletoe-color 'surface1)))))
 `(trailing-whitespace ((t (:background ,(mistletoe-color 'red)))))
 `(escape-glyph ((t (:foreground ,(mistletoe-color 'peach)))))
 `(homoglyph ((t (:foreground ,(mistletoe-color 'peach)))))

 ;; Dashboard
 `(dashboard-startup-banner ((t (:foreground ,(mistletoe-color 'teal)))))
 `(dashboard-banner-logo-title ((t (:foreground ,(mistletoe-color 'teal)))))
 `(dashboard-heading ((t (:foreground ,(mistletoe-color 'magenta)))))
 `(dashboard-footer ((t (:foreground ,(mistletoe-color 'teal)))))

 ;; Highlight faces
 `(region ((t (:background ,(mistletoe-color 'surface1)
               :extend t))))
 `(highlight ((t (:background ,(mistletoe-color 'surface0)))))
 `(hl-line ((t (:background ,(mistletoe-color 'surface0)))))
 `(isearch ((t (:background ,(mistletoe-color 'peach)
                   :foreground ,(mistletoe-color 'crust)))))
 `(lazy-highlight ((t (:background ,(mistletoe-color 'surface2)
                         :foreground ,(mistletoe-color 'text)))))

 ;; Font faces
 `(font-lock-builtin-face ((t (:foreground ,(mistletoe-color 'magenta)))))
 `(font-lock-negation-char-face ((t (:foreground ,(mistletoe-color 'const)))))
 `(font-reference-face ((t (:foreground ,(mistletoe-color 'const)))))
 `(font-lock-constant-face ((t (:foreground ,(mistletoe-color 'const)))))
 `(font-lock-doc-face ((t (:foreground ,(mistletoe-color 'const)))))
 `(font-lock-function-name-face ((t (:foreground ,(mistletoe-color 'teal)))))
 `(font-lock-keyword-face ((t (:foreground ,(mistletoe-color 'magenta)))))
 `(font-lock-string-face ((t (:foreground ,(mistletoe-color 'green)))))
 `(font-lock-type-face ((t (:foreground ,(mistletoe-color 'teal)))))
 `(font-lock-variable-name-face ((t (:foreground ,(mistletoe-color 'var)))))
 `(font-lock-warning-face ((t (:foreground ,(mistletoe-color 'warning)))))
 `(font-lock-comment-face ((t (:foreground ,(mistletoe-color 'comment)
			       :slant italic))))
 `(font-lock-comment-delimiter-face ((t (:foreground ,(mistletoe-color 'comment)
                                         :slant italic))))

 ;; Org Fonts
 `(org-code ((t (:foreground ,(mistletoe-color 'lavender)))))
 `(org-level-1 ((t (:foreground ,(mistletoe-color 'blue)
                     :weight bold :height 1.7))))
 `(org-level-2 ((t (:foreground ,(mistletoe-color 'green)
                     :weight bold :height 1.6))))
 `(org-level-3 ((t (:foreground ,(mistletoe-color 'var)
                     :weight bold :height 1.5))))
 `(org-level-4 ((t (:foreground ,(mistletoe-color 'teal)
                     :weight bold :height 1.4))))
 `(org-level-5 ((t (:foreground ,(mistletoe-color 'yellow)
		     :weight bold :height 1.3))))
 `(org-level-6 ((t (:foreground ,(mistletoe-color 'peach)
		     :weight bold :height 1.2))))
 `(org-level-7 ((t (:foreground ,(mistletoe-color 'mauve)
		     :weight bold :height 1.1))))
 `(org-level-8 ((t (:foreground ,(mistletoe-color 'flamingo)
				:weight bold :height 1.0))))
 `(org-date ((t (:foreground ,(mistletoe-color 'green) :underline t))))

  ;; Org Blocks
 `(org-block ((t (:background ,(mistletoe-color 'base1)
		  :foreground ,(mistletoe-color 'lavender)
		  :extend t))))
   `(org-block-begin-line
   ((t (:background ,(mistletoe-color 'base1)
        :foreground ,(mistletoe-color 'overlay1)
        :height 0.9 :extend t))))
 `(org-block-end-line
   ((t (:background ,(mistletoe-color 'base1)
        :foreground ,(mistletoe-color 'overlay1)
        :height 0.9 :extend t))))

 ;; Org Todo
 `(org-todo ((t (:foreground ,(mistletoe-color 'peach)
                 :weight bold))))
 `(org-done ((t (:foreground ,(mistletoe-color 'green)
                 :weight bold))))

 ;; Org Links
 `(org-link ((t (:foreground ,(mistletoe-color 'sapphire)
                  :underline t))))
 `(org-tag ((t (:foreground ,(mistletoe-color 'overlay1)
                 :weight light))))

 ;; Org Tables
 `(org-table ((t (:foreground ,(mistletoe-color 'blue)))))
 `(org-quote ((t (:foreground ,(mistletoe-color 'subtext0)
                  :background ,(mistletoe-color 'surface0)
                  :slant italic
                  :extend t))))
 `(org-verbatim ((t (:foreground ,(mistletoe-color 'yellow))))))


;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory
                (file-name-directory load-file-name))))

(provide-theme 'mistletoe)

;;; mistletoe-theme.el ends here