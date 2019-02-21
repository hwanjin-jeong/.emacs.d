(use-package ag
  :ensure t
  :defer t)

(use-package helm-ag
  :ensure t
  :defer t)

(use-package helm
  :ensure t
  :diminish helm-mode
  :bind (("M-x" . helm-M-x)
         ("C-x b" . helm-mini)
         ("M-y" . helm-show-kill-ring)))
