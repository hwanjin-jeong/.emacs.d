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
(load-profile "programming")
(load-profile "go")
(load-profile "web")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (kotlin-mode eww-lnum magit-gitflow helm-ghq ghq docker docker-compose-mode dockerfile-mode direnv typescript-mode multiple-cursors groovy-mode yaml-mode restclient smartparens avy company-go company eglot gotest go-mode counsel helm-projectile projectile helm-ag ag use-package)))
 '(safe-local-variable-values (quote ((url-max-redirections . 0)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
