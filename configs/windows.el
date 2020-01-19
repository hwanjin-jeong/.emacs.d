;;; package --- Summary"
;;; Code:
;;; Commentary:
;;; setup theme, key mappings, and windows

;;; theme
(use-package color-theme-sanityinc-tomorrow
  :ensure t
  :init
  (load-theme 'sanityinc-tomorrow-bright t))

;;; direnv
(use-package direnv
  :ensure t
  :config (direnv-mode))

;; remove top menu bar
(menu-bar-mode -1)

(put 'narrow-to-region 'disabled nil)

;;; custom function
(defun open-next-line (arg)
  "Move to the next line and then opens a line.
    See also `newline-and-indent'."
  (interactive "p")
  (end-of-line)
  (open-line arg)
  (next-line 1)
  (when newline-and-indent
    (indent-according-to-mode)))

(defun open-previous-line (arg)
  "Open a new line before the current one. 
     See also `newline-and-indent'."
  (interactive "p")
  (beginning-of-line)
  (open-line arg)
  (when newline-and-indent
    (indent-according-to-mode)))

;;; key mappings

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "M-%") 'query-replace-regexp)

(global-set-key (kbd "M-m") 'shell)

(global-set-key (kbd "C-c C-n") 'next-buffer)
(global-set-key (kbd "C-c C-p") 'previous-buffer)
(global-set-key [(control ?h)] 'delete-backward-char)
(global-set-key (kbd "C-M-i") 'completion-at-point)
(define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))
(global-set-key (kbd "M-n") 'open-next-line)
(global-set-key (kbd "M-p") 'open-previous-line)

;; multiple cursors key binding
(global-set-key (kbd "C-c m c") 'mc/edit-lines)

;; share osx clipboard
(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))
(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))
(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)

;; treemacs
(use-package treemacs
  :ensure t
  :bind (([f7] . treemacs)))

;; expand-region
(use-package expand-region
  :ensure t
  :bind (("C-j" . er/expand-region)))

;; avy
(use-package avy
  :ensure t
  :bind (("C-c g" . avy-goto-line)
	 ("C-c j" . avy-goto-word-0)))

;;; setup: sub-window movement
(use-package windmove
  :ensure t
  :bind (("C-M-b" . windmove-left)
         ("C-M-f" . windmove-right)
         ("C-M-p" . windmove-up)
         ("C-M-n" . windmove-down)))
