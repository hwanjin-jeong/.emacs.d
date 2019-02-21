;;; package --- Summary"
;;; Code:
;;; Commentary:

(package-initialize)

(defvar emacs-dir (file-name-directory load-file-name)
  "The root dir of the Emacs.")
(defvar emacs-configs-dir (expand-file-name "configs" emacs-dir))
(defvar emacs-profiles-dir (expand-file-name "profiles" emacs-dir))

(defun add-load-path (path)
  (add-to-list 'load-path (concat emacs-dir "/" path)))

(defun load-config (path)
  (load-file (concat emacs-configs-dir "/" path ".el")))

(defun load-profile (path)
  (load-file (concat emacs-profiles-dir "/" path ".el")))

(load-profile "default")
(load-profile "windows")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (linum-relative counsel zenburn-theme json-mode yaml-mode dockerfile-mode helm-projectile projectile helm-ag ag helm-swoop helm-flycheck flycheck helm-company company magit use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
