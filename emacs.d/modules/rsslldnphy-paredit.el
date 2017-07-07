(let ((byte-compile-not-obsolete-funcs (append byte-compile-not-obsolete-funcs '(preceding-sexp))))
  (use-package eval-sexp-fu :ensure t))

(use-package paredit
	:ensure t
	:init
	(progn
	(add-hook 'cider-repl-mode-hook #'paredit-mode)
	(add-hook 'clojure-mode-hook    #'paredit-mode)
	(add-hook 'emacs-lisp-mode-hook #'paredit-mode)))

(use-package rainbow-delimiters
	:ensure t)

(provide 'rsslldnphy-paredit)
