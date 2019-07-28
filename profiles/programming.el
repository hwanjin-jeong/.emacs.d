;;; package --- Summary"
;;; Code:
;;; Commentary:
;;; setup theme, key mappings, and windows

;; (use-package eglot
;;   :ensure t
;;   :hook (prog-mode . eglot-ensure)
;;   :config (progn 
;; 	    (add-to-list 'eglot-server-programs '())))

(use-package company
  :ensure t
  :init (progn
	  (use-package company-go)
	  (add-hook 'after-init-hook 'global-company-mode))
  :config
  (setq company-minimum-prefix-length 2)
  (setq company-dabbrev-downcase 0)
  (setq company-idle-delay 0.5))

(use-package smartparens
  :ensure t
  :hook (prog-mode . smartparens-mode)
  :config (setq smartparens-global-mode 1))

(load-config "restclient")

(global-set-key (kbd "C-c d") 'xref-find-definitions)
(global-set-key (kbd "C-c C-d") 'xref-find-definitions-other-window)
(global-set-key (kbd "C-c C-c") 'xref-pop-marker-stack)
(global-set-key (kbd "C-c C-s") 'xref-find-references)
