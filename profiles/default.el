;;; setup: package archives with melpa
(require 'package)
(set-default-coding-systems 'utf-8)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

;;;(package-refresh-contents) uncomment this line to solve the package not found problem
(when (not package-archive-contents)
  (package-refresh-contents))
(when (not (package-installed-p 'use-package))
  (package-install 'use-package))
(require 'use-package)

(load-conf-file "ibuffer")
(load-conf-file "windmove")

(load-conf-file "git")

(load-conf-file "company")
(load-conf-file "flycheck")

(load-conf-file "helm")
(load-conf-file "helm-swoop")
(load-conf-file "ag")
(load-conf-file "helm-ag")
(load-conf-file "projectile")

(load-conf-file "dockerfile")
(load-conf-file "yaml")
(load-conf-file "json")


(provide 'default)
