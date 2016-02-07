(require 'cask "/usr/local/Cellar/cask/0.7.4/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

(require 'better-defaults)

(setq dotfiles-dir "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/customizations/")

(setq dired-details-initially-hide t)


(require 'dired-details+)

(load-theme 'ujelly t)

(setq insert-directory-program "/usr/local/bin/gls")
(setq dired-listing-switches "-aBhl --group-directories-first")

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(ansi-color-for-comint-mode-on)

(setq visible-bell t
      vc-follow-symlinks nil
      fringe-mode (cons 4 0)
      echo-keystrokes 0.1
      font-lock-maximum-decoration t
      inhibit-startup-message t
      transient-mark-mode t
      color-theme-is-global t
      shift-select-mode nil
      mouse-yank-at-point t
      require-final-newline t
      truncate-partial-width-windows nil
      uniquify-buffer-name-style 'forward
      ffap-machine-p-known 'reject
      whitespace-style '(trailing lines space-before-tab
                                  face indentation space-after-tab)
      whitespace-line-column 100
      ediff-window-setup-function 'ediff-setup-windows-plain
      oddmuse-directory (concat dotfiles-dir "oddmuse")
      xterm-mouse-mode t
      save-place-file (concat dotfiles-dir "places"))

(ido-mode t)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-max-prospects 10)

;; (setq ido-everywhere t)
;; (ido-vertical-mode)

(set-default 'indent-tabs-mode nil)
(set-default 'indicate-empty-lines t)
(set-default 'imenu-auto-rescan t)
(setq x-select-enable-clipboard t)

(defalias 'yes-or-no-p 'y-or-n-p)

(projectile-global-mode)
(setq projectile-switch-project-action '(lambda () (dired projectile-project-root)))

(set-default 'truncate-lines t)

(require 'evil)

(setq evil-shift-width 2)



(require 'evil-leader)


(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key
  "b"     'switch-to-buffer
  "f"     'ag-project
  "v"     'vsplit
  "h"     'evil-window-split
  "k"     'kill-buffer
  "<RET>" 'nohl
  "<SPC>" 'projectile-find-file)
(evil-mode 1)

(add-hook 'after-init-hook
          '(lambda ()
             (menu-bar-mode -1)))

(require 'rd-movements)

(require 'ag)

(global-set-key (kbd "C-w") 'evil-window-map)
(define-key evil-motion-state-map (kbd "C-e") 'move-end-of-line)

(global-set-key (kbd "C-h") 'evil-window-left)
(global-set-key (kbd "C-j") 'evil-window-down)
(global-set-key (kbd "C-k") 'evil-window-up)
(global-set-key (kbd "C-l") 'evil-window-right)
(global-set-key (kbd "C-w C-h") 'evil-window-left)
(global-set-key (kbd "C-w C-j") 'evil-window-down)
(global-set-key (kbd "C-w C-k") 'evil-window-up)
(global-set-key (kbd "C-w C-l") 'evil-window-right)
(define-key evil-normal-state-map (kbd "C-o C-l") 'paredit-forward-slurp-sexp)
(define-key evil-normal-state-map (kbd "C-o C-h") 'paredit-forward-barf-sexp)
(define-key evil-normal-state-map (kbd "C-o C-j") 'paredit-backward-slurp-sexp)
(define-key evil-normal-state-map (kbd "C-o C-k") 'paredit-backward-barf-sexp)

(global-set-key (kbd "C-6") 'previous-buffer)

(evil-global-set-key 'normal (kbd ",,") 'projectile-toggle-between-implementation-and-test)
(evil-global-set-key 'normal (kbd ",\\") 'projectile-switch-project)

(setq indent-tabs-mode nil)
(setq tab-width 2)

(setq tab-always-indent 'complete)
(add-to-list 'completion-styles 'initials t)

(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (paredit-mode)
             (auto-complete-mode)
             (modify-syntax-entry ?- "w")))

(add-hook 'clojure-mode-hook
          '(lambda ()
             (paredit-mode)
             (put-clojure-indent ':import :defn)
             (put-clojure-indent ':require-macros :defn)
             (put-clojure-indent ':require :defn)
             (put-clojure-indent 'defrecord :defn)
             (auto-complete-mode)
             (modify-syntax-entry ?- "w")))

(defun cask-install ()
  (interactive)
  (shell-command "cd ~/.emacs.d && cask install"))

(eval-after-load 'evil-ex
  '(progn
     (evil-ex-define-cmd "W" 'save-buffer)
     ))

(eval-after-load 'evil-ex
  '(evil-ex-define-cmd "Wq" '(lambda ()
                               (save-buffer)
                               (save-buffers-kill-terminal))))
(eval-after-load 'evil-ex
  '(evil-ex-define-cmd "Wqa" '(lambda ()
                                (save-some-buffers 'no-confirm)
                                (save-buffers-kill-terminal))))

(define-key evil-normal-state-map (kbd "gcc") 'evilnc-comment-or-uncomment-lines)
(define-key evil-normal-state-map (kbd "gcr") 'comment-or-uncomment-region)

(add-to-list 'auto-mode-alist '("Cask" . emacs-lisp-mode))
(add-to-list 'auto-mode-alist '("riemann.config" . clojure-mode))

(add-to-list 'safe-local-variable-values '(lexical-binding . t))
(add-to-list 'safe-local-variable-values '(whitespace-line-column . 80))
(show-paren-mode 1)

(if (< (length command-line-args) 2)
    (progn (cd "~/Code")
           (setq initial-buffer-choice "~/Code")))
