;;; package --- Summary"
;;; Code:
;;; Commentary:
;;; setup theme, key mappings, and windows

;;; theme
(use-package color-theme-sanityinc-tomorrow
  :ensure t
  :init
  (load-theme 'sanityinc-tomorrow-bright t))

;; remove top menu bar
(menu-bar-mode -1)

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
(load-config "helm")
(load-config "counsel")
(load-config "windmove")
(load-config "expand-region")
(load-config "projectile")
(load-config "avy")

(global-set-key (kbd "M-m") 'shell)
(global-set-key (kbd "C-c C-n") 'next-buffer)
(global-set-key (kbd "C-c C-p") 'previous-buffer)
(global-set-key [(control ?h)] 'delete-backward-char)
(global-set-key (kbd "C-M-i") 'completion-at-point)
(global-set-key (kbd "M-n") 'open-next-line)
(global-set-key (kbd "M-p") 'open-previous-line)

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

(load-config "git")
