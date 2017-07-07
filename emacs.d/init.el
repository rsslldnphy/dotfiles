(package-initialize)

(setq inhibit-startup-message t
      vc-follow-symlinks      t
      shell-file-name         "/bin/bash"
			font-use-system-font    t
			linum-format            "%4d \u2502 "

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

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(defalias 'yes-or-no-p 'y-or-n-p)
(set-default 'truncate-lines t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(show-paren-mode 1)
(menu-bar-mode 0)
(global-visual-line-mode 1)
(global-linum-mode 1)
(tool-bar-mode 0)
(global-hl-line-mode 1)
(set-face-background hl-line-face "#206040")
(set-face-attribute hl-line-face nil :underline nil)
(load-theme 'wombat)

(require 'rsslldnphy-core)
(require 'rsslldnphy-evil)
(require 'rsslldnphy-paredit)
(require 'rsslldnphy-clojure)
(require 'rsslldnphy-magit)
(require 'rsslldnphy-docker)
(require 'rsslldnphy-js)
(require 'rsslldnphy-yaml)
(require 'rsslldnphy-nginx)
