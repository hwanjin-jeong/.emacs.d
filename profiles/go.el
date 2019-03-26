;;; package --- Summary"
;;; Code:
;;; Commentary:

(use-package go-mode
  :ensure t
  :init (progn (shell-command "go get github.com/sourcegraph/go-langserver")
	       (shell-command "go get golang.org/x/tools/cmd/goimports")
	       (shell-command "go get github.com/tools/godep")))

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
    (local-set-key (kbd "C-c C-s") 'xref-find-references))
  (set (locale-local-variable 'compile-command)
       "go build -v && go test -v && go vet"))

(add-hook 'go-mode-hook 'my-go-mode-hook)

(add-hook 'go-mode-hook(lambda ()
			 (setq-default) 
			 (setq tab-width 2) 
			 (setq standard-indent 2) 
			 (setq indent-tabs-mode 1)))

