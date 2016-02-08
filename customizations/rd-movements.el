(defun rd-movements-find-file ()
  (interactive)
  (condition-case nil
      (projectile-find-file)
    ('error (ido-find-file))))

(defun rd-movements-vsplit ()
  (interactive)
  (split-window-right)
  (next-multiframe-window))

(defun rd-movements-hsplit ()
  (interactive)
  (evil-window-split)
  (next-multiframe-window))

(evil-leader/set-key
  "v"     'rd-movements-vsplit
  "h"     'rd-movements-hsplit
  "<SPC>" 'rd-movements-find-file)

(global-set-key (kbd "C-j") 'evil-window-down)
(global-set-key (kbd "C-k") 'evil-window-up)
(global-set-key (kbd "C-h") 'evil-window-left)
(global-set-key (kbd "C-l") 'evil-window-right)

(global-set-key (kbd "C-w") 'evil-window-map)
(global-set-key (kbd "C-w C-h") 'evil-window-left)
(global-set-key (kbd "C-w C-j") 'evil-window-down)
(global-set-key (kbd "C-w C-k") 'evil-window-up)
(global-set-key (kbd "C-w C-l") 'evil-window-right)

(define-key evil-motion-state-map (kbd "C-e") 'move-end-of-line)

;; unmap some clashing keybindings in dired mode
(define-key dired-mode-map (kbd "g") nil)
(define-key dired-mode-map (kbd "G") nil)

(global-set-key (kbd "C-6") 'previous-buffer)

(provide 'rd-movements)
