;;; package --- Summary"
;;; Code:
;;; Commentary:
;;; setup theme, key mappings, and windows


(use-package eglot
  :hook (prog-mode . eglot-ensure)
  :config (progn 
	    (add-to-list 'eglot-server-programs '())))

(use-package company
  :ensure t
  :init (progn
	  (use-package company-go)
	  (add-hook 'after-init-hook 'global-company-mode)))

