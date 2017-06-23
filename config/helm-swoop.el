(use-package helm-swoop
  ;; Helm version of C-s (I-search) and C-r (I-search backward)
  :ensure t
  :defer t
  :bind
  (("M-i" . helm-swoop)
   ("M-I" . helm-swoop-back-to-last-point)
   ("C-c M-i" . helm-multi-swoop)
   ("C-x M-i" . helm-multi-swoop-all)
   :map isearch-mode-map
   ("M-i" . helm-swoop-from-isearch))
  :config
  (setq helm-swoop-use-line-number-face t)
  (setq helm-swoop-split-direction 'split-window-vertically)
  (setq helm-swoop-split-with-multiple-windows nil))
