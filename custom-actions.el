(defun qoute-text (b e)
  "Wraps specified text with specified character"
  ;; (interactive "r\nMEnter char to wrap with: ")
  (interactive "r")
  (save-restriction
    (narrow-to-region b e)
    (goto-char (point-min))
    (insert "\"")
    (goto-char (point-max))
    (insert "\"")))

(global-set-key (kbd "C-x C-'") 'qoute-text)
