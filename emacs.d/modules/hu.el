(defun healthunlocked/project-root ()
  (let ((deploy-config (locate-dominating-file default-directory "deploy.yml")))
    (if deploy-config
        (file-name-directory deploy-config))))

(defun healthunlocked/hu (command)
  (let ((default-directory (healthunlocked/project-root)))
    (if default-directory
        (progn
          (term "/bin/bash")
          (process-send-string "*terminal*" (concat "hu " command "\n"))))))

(provide 'hu)
