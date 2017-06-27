;;; setup: theme
(use-package color-theme-sanityinc-tomorrow
  :ensure t
  :init
  (load-theme 'sanityinc-tomorrow-bright t))

;;; setup: top menu bar
(menu-bar-mode -1)

;;; setup: indent
(setq-default indent-tabs-mode nil)
(setq-default c-basic-indent 2)
(setq-default tab-width 2)

;; preventing emacs version > 25 from making a new window to display a shell buffer
(push (cons "\\*shell\\*" display-buffer--same-window-action) display-buffer-alist)
