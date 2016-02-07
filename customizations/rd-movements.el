(defun rd-movements-vsplit ()
  (interactive)
  (split-window-right)
  (next-window))

(defun rd-movements-hsplit ()
  (interactive)
  (split-window-botto)
  (next-window))

(evil-leader/set-key
  "v" 'rd-movements-vsplit
  "h" 'rd-movements-hsplit)

(provide 'rd-movements)
