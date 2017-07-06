(setq shell-file-name "/bin/bash")

(defalias 'yes-or-no-p 'y-or-n-p)

(set-default 'truncate-lines t)

(setq inhibit-startup-message t)

(setq dotfiles-dir
      (file-name-directory (or (buffer-file-name) (file-chase-links load-file-name))))

(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
	("org"   . "https://orgmode.org/elpa/")
	("gnu"   . "https://elpa.gnu.org/packages/")))

(package-initialize)

(when (not (package-installed-p 'paradox))
  (package-install 'paradox))

(paradox-require 'evil)
(paradox-require 'evil-leader)
(paradox-require 'projectile)
(paradox-require 'ag)
(paradox-require 'helm)
(paradox-require 'helm-ag)
(paradox-require 'helm-projectile)
(paradox-require 'auto-complete)

(paradox-require 'clojure-mode)
(paradox-require 'cider)
(paradox-require 'ac-cider)
(paradox-require 'clj-refactor)
(paradox-require 'paredit)
(paradox-require 'rainbow-delimiters)

(add-hook 'cider-repl-mode-hook #'paredit-mode)
(add-hook 'clojure-mode-hook    #'paredit-mode)
(add-hook 'emacs-lisp-mode-hook #'paredit-mode)

(paradox-require 'docker)
(paradox-require 'dockerfile-mode)
(paradox-require 'yaml-mode)
(paradox-require 'js)

(ac-config-default)
(add-hook 'cider-mode-hook #'ac-cider-setup)
(add-hook 'cider-repl-mode-hook #'ac-cider-setup)

(global-evil-leader-mode t)
(setq evil-move-beyond-eol t)

(evil-leader/set-leader ",")
(evil-leader/set-key
  "v"     'evil-window-vsplit
  "h"     'evil-window-split
  "<SPC>" 'helm-projectile-find-file)
(evil-mode 1)

(define-key dired-mode-map (kbd "<SPC>") nil)
(define-key evil-normal-state-map (kbd "C-j")    'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k")    'evil-window-up)
(define-key evil-normal-state-map (kbd "C-h")    'evil-window-left)
(define-key evil-normal-state-map (kbd "C-l")    'evil-window-right)

(define-key evil-normal-state-map (kbd "<SPC><SPC>") 'helm-projectile-switch-project)
(define-key evil-normal-state-map (kbd "<SPC><escape>") (lambda () (interactive) (find-file "~/.emacs.d/init.el")))

(define-key evil-normal-state-map (kbd "C-c C-k") 'eval-buffer)

(define-key evil-normal-state-map (kbd "C-a") 'evil-start-of-line)
(define-key evil-normal-state-map (kbd "C-e") 'evil-end-of-line)
(define-key evil-normal-state-map (kbd "C-n") 'evil-next-line)
(define-key evil-normal-state-map (kbd "C-p") 'evil-previous-line)

(evil-ex-define-cmd "W" "w")
(evil-ex-define-cmd "Wq" "wq")

(projectile-mode 1)
(helm-projectile-on)

(menu-bar-mode -1)

(setq helm-mode-fuzzy-match t)
(setq projectile-completion-system 'helm)

(setq backup-directory-alist `(("." . "~/.emacs-backups")))

(load-theme 'wombat)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (ac-cider auto-complete dockerfile-mode paredit js-mode javascript javascript-mode yaml-mode yaml docker docker-mode magit cider evil-leader helm-ag ag helm-projectile use-package paradox helm evil clojure-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
