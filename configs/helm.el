;; References: https://github.com/tuhdo/emacs-c-ide-demo/blob/master/custom/setup-helm.el
(use-package helm
  :init
  (progn
    (require 'helm-config)
    (require 'helm-grep)
    (use-package helm-ag
      :ensure t
      :defer t)

    (when (executable-find "curl")
      (setq helm-google-suggest-use-curl-p t))

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
		helm-display-header-line nil)

    (global-set-key (kbd "M-x") 'helm-M-x)
    (global-set-key (kbd "M-s") 'helm-do-ag-this-file)
    (global-set-key (kbd "C-x C-b") 'helm-buffers-list)
    (global-set-key (kbd "C-x C-f") 'helm-find-files)
    (global-set-key (kbd "C-c r") 'helm-recentf)
    (global-set-key (kbd "M-y") 'helm-show-kill-ring)

    (global-set-key (kbd "C-c h w") 'helm-wikipedia-suggest)
    (global-set-key (kbd "C-c h g") 'helm-google-suggest)

    (global-set-key (kbd "C-c h x") 'helm-register)

    ;;; Save current position to mark ring
    (add-hook 'helm-goto-line-before-hook 'helm-save-current-pos-to-mark-ring)

    (helm-mode 1)

    (use-package helm-projectile
      :ensure t
      :init
      (setq helm-projectile-on 1)
      (setq projectile-completion-system 'helm)
      (setq projectile-indexing-method 'alien))))

(use-package helm-xref
  :ensure t
  :init (setq xref-show-xrefs-function 'helm-xref-show-xrefs))
