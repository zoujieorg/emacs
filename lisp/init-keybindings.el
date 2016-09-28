(provide 'init-keybindings)

(global-set-key (kbd "<f2>") 'open-my-init-file)
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

(setq org-agenda-files '("~/.emacs.d/org"))
(global-set-key (kbd "C-c a") 'org-agenda)

;;使用git的文件加快查找
;;C-c用户自定义前缀多为C-c
;; p 表示project
;; f 表示file
(global-set-key (kbd "C-c p f") 'counsel-git)

;;相当于company,自动补齐比如路径"~/.emac"
(global-set-key (kbd "s-/") 'hippie-expand)
(setq hippie-expand-try-functions-list '(try-expand-dabbrev
					try-expand-dabbrev-all-buffers
					try-expand-dabbrev-from-kill
					try-complete-file-name-partially
					try-complete-file-name
					try-expand-all-abbrevs
					try-expand-list
					try-expand-line
					try-complete-lisp-symbol-partially
					try-complete-lisp-symbol))

