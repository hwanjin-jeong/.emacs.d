;; setup: projectile
(require 'helm)
(use-package projectile
  :ensure t
  :init (progn (projectile-mode))
  :config (progn
            (setq projectile-enable-caching nil)
	    (setq projectile-completion-system 'helm))
  :bind (("C-c p f" . projectile-find-file)
	 ("C-c p s" . projectile-ag)))

