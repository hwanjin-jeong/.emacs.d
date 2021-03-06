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

(load-config "default")
(load-config "helm")
(load-config "git")
(load-config "windows")
(load-config "lsp")
(load-config "golang")
(load-config "web")
(load-config "docker")
(load-config "restclient")
(load-config "yasnippet")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (json-mode restclient company-terraform gitignore-mode terraform-mode php-mode treemacs lsp-java lsp-mode kotlin-mode magit-gitflow docker-compose-mode dockerfile-mode direnv typescript-mode multiple-cursors groovy-mode yaml-mode smartparens avy company eglot gotest go-mode helm-projectile projectile helm-ag ag use-package)))
 '(safe-local-variable-values (quote ((url-max-redirections . 0)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'set-goal-column 'disabled nil)
