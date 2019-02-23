;;; package --- Summary"
;;; Code:
;;; Commentary:
;;; setup theme, key mappings, and windows


(use-package eglot
  :hook (prog-mode . eglot-ensure)
  :config (progn 
	    (add-to-list 'eglot-server-programs '())))

(use-package go-mode
  :ensure t
  :init (progn (shell-command "go get github.com/sourcegraph/go-langserver")
	       (shell-command "go get golang.org/x/tools/cmd/goimports")))

(defun my-go-mode-hook ()
  (setq gofmt-command "goimports")
  ;;(require 'go-mode-autoloads)
  (add-hook 'before-save-hook 'gofmt-before-save)
  (use-package gotest
    :ensure t
    :config
    (setq go-test-verbose t)
    (local-set-key (kbd "C-c t t") 'go-test-current-test)
    (local-set-key (kbd "C-c t f") 'go-test-current-file)
    (local-set-key (kbd "C-c t p") 'go-test-current-project))
  (set (make-local-variable 'compile-command)
       "go build -v && go test -v && go vet"))

(add-hook 'go-mode-hook 'my-go-mode-hook)

(add-hook 'go-mode-hook(lambda ()
			 (setq-default) 
			 (setq tab-width 2) 
			 (setq standard-indent 2) 
			 (setq indent-tabs-mode 1)))
