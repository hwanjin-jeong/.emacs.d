;;; package --- Summary"
;;; Code:
;;; Commentary:
;;; setup package archives with melpa

(require 'package)
(set-default-coding-systems 'utf-8)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;;;(package-refresh-contents) uncomment this line to solve the package not found problem
(when (not package-archive-contents)
  (package-refresh-contents))
(when (not (package-installed-p 'use-package))
  (package-install 'use-package))
(require 'use-package)

(provide 'default)
