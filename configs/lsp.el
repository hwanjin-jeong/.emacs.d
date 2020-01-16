;;; package --- Summary"
;;; Code:
;;; Commentary:
;;; setup theme, key mappings, and windows

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook (go-mode . lsp-deferred))

;; Optional - provides fancier overlays.
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

;; Company mode is a standard completion package that works well with lsp-mode.
(use-package company
  :ensure t
  :config
  ;; Optionally enable completion-as-you-type behavior.
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1))

;; company-lsp integrates company mode completion with lsp-mode.
;; completion-at-point also works out of the box but doesn't support snippets.
(use-package company-lsp
  :ensure t
  :commands company-lsp)

(use-package lsp-mode
  :config
  (add-hook 'python-mode-hook #'lsp)
  (add-hook 'kotlin-mode-hook #'lsp)  
  (add-hook 'java-mode-hook #'lsp))

(use-package company
  :ensure t
  :config
  (setq company-minimum-prefix-length 2)
  (setq company-dabbrev-downcase 0)
  (setq company-idle-delay 0.5))

;; for java
(use-package company-lsp :ensure t)
(use-package lsp-ui :ensure t)
(use-package lsp-java :ensure t :after lsp
  :config
  (add-hook 'java-mode-hook 'lsp)
  (add-hook 'kotlin-mode-hook 'lsp))

(use-package smartparens
  :ensure t
  :config (smartparens-global-mode 1))

;; Key mappings
;; (global-set-key (kbd "C-c d") 'xref-find-definitions)
;; (global-set-key (kbd "C-c C-d") 'xref-find-definitions-other-window)
;; (global-set-key (kbd "C-c C-c") 'xref-pop-marker-stack)
;; (global-set-key (kbd "C-c C-s") 'xref-find-references)
