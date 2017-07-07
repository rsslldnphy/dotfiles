(defun rsslldnphy/emacs-config-edit ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun rsslldnphy/comment ()
  (interactive)
  (if (evil-visual-state-p)
      (paredit-comment-dwim)
    (if (not paredit-mode)
        (comment-line 1)
      (progn (evil-beginning-of-line)
             (evil-visual-line)
             (forward-sexp)
             (paredit-comment-dwim)))))

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
                  "f"     'helm-projectile-ag
                  "b"     'helm-buffers-list
                  "k"     'kill-buffer
                  "g"     'magit-status)))

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

    (define-key evil-normal-state-map (kbd "W") 'forward-sexp)
    (define-key evil-normal-state-map (kbd "B") 'backward-sexp)
    (define-key evil-visual-state-map (kbd "W") 'forward-sexp)
    (define-key evil-visual-state-map (kbd "B") 'backward-sexp)

    (define-key evil-normal-state-map (kbd "C-c C-k") 'eval-buffer)

    (define-key evil-normal-state-map (kbd "C-c C-l") 'paredit-forward-slurp-sexp)
    (define-key evil-normal-state-map (kbd "C-c C-h") 'paredit-forward-barf-sexp)
    (define-key evil-normal-state-map (kbd "C-c l")   'paredit-backward-barf-sexp)
    (define-key evil-normal-state-map (kbd "C-c h")   'paredit-backward-slurp-sexp)
    (define-key evil-normal-state-map (kbd "C-c C-d") 'paredit-splice-sexp)

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

    (define-key evil-normal-state-map (kbd "gc") 'rsslldnphy/comment)

    (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)

    (defalias #'forward-evil-word #'forward-evil-symbol)
    (evil-ex-define-cmd "W" "w")
    (evil-ex-define-cmd "Wq" "wq")))

(provide 'rsslldnphy-evil)
