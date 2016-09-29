
(provide 'init-functions)
(defun open-my-init-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ;; 命名
					    ("9zo" "zoujieorg")
					    ("9zp" "zoujieorg/packages")
					    ))

(defun indent-buffer ()
  "当前可视buffer区缩进"
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer ()
  "对选择区缩进，否则对整个buffer缩进"
  (interactive)
  (save-excursion)
  (if (region-active-p)
      (progn
	(indent-region (region-beginning) (region-end))
	(message "Indented selected region."))
    (progn
      (indent-buffer)
      (message "Indented buffer."))))

(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

;;隐藏Dos换行符
(defun hidden-dos-eol ()
  "Do not show ^M in files containing mixed Unix and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-tableF))
  (aset buffer-display-table ?\^M []))

;;删除Dos换行符
(defun remove-dos-eol ()
  "Do not show ^M in files containing mixed Unix and DOS line endings."
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))
