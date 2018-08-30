(use-package clojure-mode
  :ensure t
  :defer t
  :mode (("\\.clj\\'" . clojure-mode)
         ("\\.edn\\'" . clojure-mode))
  :init
  (use-package cider
    :ensure t
    :init
    (add-hook 'cider-repl-mode-hook #'paredit-mode)
    :config
    (setq clojure-indent-style 'align-arguments
          cider-cljs-lein-repl "(do (use 'figwheel-sidecar.repl-api) (start-figwheel!) (cljs-repl))"))

  (use-package ac-cider
    :ensure t
    :init
    (add-hook 'cider-mode-hook #'ac-cider-setup)
    (add-hook 'cider-repl-mode-hook #'ac-cider-setup))

  (use-package clj-refactor
    :ensure t))

(provide 'rsslldnphy-clojure)
