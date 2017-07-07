(package-initialize)

(setq inhibit-startup-message t
      vc-follow-symlinks      t
      shell-file-name         "/bin/bash"

			backup-directory-alist  '(("." . "~/.backups"))
			backup-by-copying       t
			delete-old-versions     t
			kept-new-versions       6
			kept-old-versions       2
			version-control         t

      dotfiles-dir
      (file-name-directory (or (buffer-file-name)
                               (file-chase-links load-file-name)))

      autoload-file
      (concat dotfiles-dir "loaddefs.el")

      custom-file
      (concat dotfiles-dir "custom.el")

      package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("org"   . "https://orgmode.org/elpa/")
        ("gnu"   . "https://elpa.gnu.org/packages/")))

(add-to-list 'load-path (concat dotfiles-dir "modules"))
(load custom-file 'noerror)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(require 'rsslldnphy-core)
(require 'rsslldnphy-evil)
(require 'rsslldnphy-paredit)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(defalias 'yes-or-no-p 'y-or-n-p)
(setq-default truncate-lines t)
(setq-default tab-width 2)
(menu-bar-mode -1)
(load-theme 'wombat)

;; (paradox-require 'nginx-mode)

;; (paradox-require 'clojure-mode)
;; (paradox-require 'cider)

;; (paradox-require 'ac-cider)
;; (paradox-require 'clj-refactor)
;; (paradox-require 'paredit)
;; (paradox-require 'rainbow-delimiters)


;; ;; (paradox-require 'cider-eval-sexp-fu)

;; (add-hook 'cider-repl-mode-hook #'paredit-mode)
;;
;;

;; (paradox-require 'docker)
;; (paradox-require 'dockerfile-mode)
;; (paradox-require 'yaml-mode)
;; (paradox-require 'js)

;; (add-hook 'cider-mode-hook #'ac-cider-setup)
;; (add-hook 'cider-repl-mode-hook #'ac-cider-setup)
