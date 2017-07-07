(defun rsslldnphy/emacs-config-edit ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(use-package evil
	:ensure t
	:init
	(progn
		;; if we don't have this evil overwrites the cursor color
		(setq evil-default-cursor t)

		;; This has to be before we invoke evil-mode due to:
		;; https://github.com/cofi/evil-leader/issues/10
		(use-package evil-leader
			:ensure t
			:init   (global-evil-leader-mode)
			:config (progn
								(evil-leader/set-leader ",")
								(evil-leader/set-key
									"v"     'evil-window-vsplit
									"h"     'evil-window-split
									"<SPC>" 'helm-projectile-find-file
									"f"     'helm-projectile-ag)))

		(setq evil-move-beyond-eol t)
		(evil-mode 1)

		(define-key dired-mode-map (kbd "<SPC>") nil)

		(define-key evil-normal-state-map (kbd "C-j")    'evil-window-down)
		(define-key evil-normal-state-map (kbd "C-k")    'evil-window-up)
		(define-key evil-normal-state-map (kbd "C-h")    'evil-window-left)
		(define-key evil-normal-state-map (kbd "C-l")    'evil-window-right)

		(define-key evil-normal-state-map (kbd "<SPC><SPC>")    'helm-projectile-switch-project)
		(define-key evil-normal-state-map (kbd "<SPC><escape>") 'rsslldnphy/emacs-config-edit)
		(define-key evil-normal-state-map (kbd "<SPC>!")        'projectile-run-shell-command-in-root)

		(define-key evil-normal-state-map (kbd "C-c C-k") 'eval-buffer)

		(define-key evil-normal-state-map (kbd "C-a") 'evil-beginning-of-line)
		(define-key evil-normal-state-map (kbd "C-e") 'evil-end-of-line)
		(define-key evil-normal-state-map (kbd "C-n") 'evil-next-line)
		(define-key evil-normal-state-map (kbd "C-p") 'evil-previous-line)

		(define-key evil-insert-state-map (kbd "C-a") 'evil-beginning-of-line)
		(define-key evil-insert-state-map (kbd "C-e") 'evil-end-of-line)
		(define-key evil-insert-state-map (kbd "C-n") 'evil-next-line)
		(define-key evil-insert-state-map (kbd "C-p") 'evil-previous-line)

		(define-key evil-visual-state-map (kbd "C-a") 'evil-beginning-of-line)
		(define-key evil-visual-state-map (kbd "C-e") 'evil-end-of-line)
		(define-key evil-visual-state-map (kbd "C-n") 'evil-next-line)
		(define-key evil-visual-state-map (kbd "C-p") 'evil-previous-line)

		(define-key evil-normal-state-map (kbd "gc") 'paredit-comment-dwim)

		(define-key evil-insert-state-map (kbd "C-g")'evil-normal-state)

		(defalias #'forward-evil-word #'forward-evil-symbol)
		(evil-ex-define-cmd "W" "w")
		(evil-ex-define-cmd "Wq" "wq")))

(provide 'rsslldnphy-evil)
