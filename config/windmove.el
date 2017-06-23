;;; setup: sub-window movement
(use-package windmove
  :ensure t
  :bind (("C-M-b" . windmove-left)
         ("C-M-f" . windmove-right)
         ("C-M-p" . windmove-up)
         ("C-M-n" . windmove-down)))
