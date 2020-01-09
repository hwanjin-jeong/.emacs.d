;;; package -- restclient

(use-package restclient
  :ensure t
  :mode (("\\.http\\'" . restclient-mode)
	 ("\\.request\\'" . restclient-mode)))
  
