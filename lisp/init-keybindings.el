(provide 'init-keybindings)

(global-set-key (kbd "<f2>") 'open-my-init-file)
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

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


(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous)
  )

;; sudo aptitude install silversearcher-ag
(global-set-key (kbd "C-c p s") 'helm-do-ag-project-root)
