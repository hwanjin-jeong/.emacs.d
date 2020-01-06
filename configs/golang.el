;;; package --- Summary"
;;; Code:
;;; Commentary:

(use-package go-mode
  :init (progn (shell-command "go get golang.org/x/tools/gopls")
 	       (shell-command "go get golang.org/x/tools/cmd/goimports")
 	       (shell-command "go get github.com/tools/godep"))
  :bind (:map go-mode-map
              ("{" . my-go-electric-brace))
  :hook ((go-mode . lsp)
         (go-mode . smartparens-mode))
  :config
  (defun my-go-mode-hook ()
    (setq gofmt-command "goimports")
    (add-hook 'before-save-hook 'gofmt-before-save)
    (use-package gotest
      :ensure t
      :config
      (setq go-test-verbose t)
      (local-set-key (kbd "C-c t t") 'go-test-current-test)
      (local-set-key (kbd "C-c t f") 'go-test-current-file)
      (local-set-key (kbd "C-c t p") 'go-test-current-project)
      (local-set-key (kbd "C-c C-r") 'go-run)
      (local-set-key (kbd "C-c d") 'xref-find-definitions)
      (local-set-key (kbd "C-c C-d") 'xref-find-definitions-other-window)
      (local-set-key (kbd "C-c C-c") 'xref-pop-marker-stack)
      (local-set-key (kbd "C-c C-s") 'xref-find-references)))
  
  (add-hook 'go-mode-hook 'my-go-mode-hook)
  
  (add-hook 'go-mode-hook(lambda ()
			   (setq-default) 
			   (setq tab-width 2) 
			   (setq standard-indent 2) 
			   (setq indent-tabs-mode 1)))
  (use-package go-guru
    :ensure t
    :after go-mode))


(defun my-go-electric-brace ()
  "Insert an opening brace may be with the closing one.
If there is a space before the brace also adds new line with
properly indented closing brace and moves cursor to another line
inserted between the braces between the braces."
  (interactive)
  (insert "{")
  (when (looking-back " {")
    (newline)
    (indent-according-to-mode)
    (save-excursion
      (newline)
      (insert "}")
      (indent-according-to-mode))))

(eval-after-load 'speedbar
  '(speedbar-add-supported-extension ".go"))
