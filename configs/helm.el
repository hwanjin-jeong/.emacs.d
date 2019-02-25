(use-package helm
  :ensure t
  :diminish helm-mode
  :init (progn
	  (use-package helm-ag
	    :ensure t
	    :defer t)
	  (setq helm-google-suggest-use-curl-p t
		helm-scroll-amount 4
		helm-autoresize-mode 1
		helm-ff-search-library-in-sexp t		
		helm-ag-base-command "rg --smart-case --no-heading --line-number"
		helm-grep-ag-command "rg --color=always --colors match:fg:black --colors match:bg:yellow --smart-case --no-heading --line-number %s %s %s"
		helm-grep-ag-pipe-cmd-switches '("--colors match:fg:black" "--colors match:bg:yellow")
		helm-grep-default-command "rg --smart-case --no-heading --line-number"
		helm-split-window-in-side-p t
		helm-mode-fuzzy-match t
		helm-buffers-fuzzy-matching t
		helm-semantic-fuzzy-match t
		helm-M-x-fuzzy-match t
		helm-lisp-fuzzy-completion t
		helm-buffer-skip-remote-checking t
		helm-locate-fuzzy-match t
		helm-display-header-line nil))
  :bind (("M-x" . helm-M-x)
         ("C-x b" . helm-mini)
         ("M-y" . helm-show-kill-ring)))

(require 'helm-xref)
(setq xref-show-xrefs-function 'helm-xref-show-xrefs)
