;;; package --- Summary"
;;; Code:
;;; Commentary:
;;; setup package archives with melpa

(require 'package)
(set-default-coding-systems 'utf-8)
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("elpa" . "https://elpa.gnu.org/packages/") t)
(package-initialize)

;;;(package-refresh-contents) uncomment this line to solve the package not found problem
(when (not package-archive-contents)
  (package-refresh-contents))
(when (not (package-installed-p 'use-package))
  (package-install 'use-package))
(require 'use-package)

(provide 'default)

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))
