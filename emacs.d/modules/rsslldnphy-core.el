(use-package helm
  :ensure t
  :init
  (progn
    (setq helm-mode-fuzzy-match t)))

(use-package projectile
  :ensure t
  :init
  (progn
    (setq projectile-completion-system 'helm)
    (projectile-mode 1)
    (projectile-discover-projects-in-directory "~/Code/")))

(use-package ag
  :ensure t)

(use-package helm-ag
  :ensure t)

(use-package helm-projectile
  :ensure t
  :init   (helm-projectile-on))

(use-package auto-complete
  :ensure t
  :init   (ac-config-default))

(provide 'rsslldnphy-core)
