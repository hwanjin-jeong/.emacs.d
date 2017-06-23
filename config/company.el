(use-package company
  :ensure t
  :init
  (global-company-mode)
  :config
  (use-package helm-company
    :ensure t))
