(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode)
  :config
  (use-package helm-flycheck
    :ensure t))
