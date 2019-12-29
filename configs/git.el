
(use-package magit
  :ensure t
  :defer t
  :bind (([f8] . magit-status))
  :init (use-package magit-gitflow
	  :ensure t
	  :defer t ))

;; (global-set-key (kbd "M-g s") 'magit-status)
;; (global-set-key (kbd "M-g c") 'magit-commit)
;; (global-set-key (kbd "M-g p") 'magit-push)
(add-hook 'magit-mode-hook 'turn-on-magit-gitflow)
