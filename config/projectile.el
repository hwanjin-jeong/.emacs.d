;; setup: projectile
(use-package projectile
  :ensure t
  :init (progn
          (projectile-mode))
  :config (progn
            (setq projectile-enable-caching nil)
            (setq projectile-completion-system 'helm)
            (setq projectile-switch-project-action 'helm-projectile)
            (use-package helm-projectile
              :ensure t
              :config
              (setq projectile-completion-system 'helm)
              (helm-projectile-on)
              (setq proejctile-switch-project-action 'helm-projectile))))
