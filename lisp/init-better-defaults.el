(provide 'init-better-defaults)
;;全屏
(setq initial-frame-alist '((fullscreen . maximized)))
(tool-bar-mode -1)
(scroll-bar-mode -1)
;;关闭提示音
(setq ring-bell-function 'ignore)
;;关闭缩进
(electric-indent-mode -1)
(setq inhibit-splash-screen t)
(global-linum-mode t)
(setq-default cursor-type 'bar)
(global-company-mode t)
;;取消"~"结尾的自动备份文件。
(setq make-backup-files nil)
;;取消自动保存~/.emacs.d/auto-save-list文件夹即没有了。
(setq auto-save-default nil)
;;选择文本内容时，如有键入，则选择内容被替换
(delete-selection-mode t)

;;注释文件中的语法高亮
(setq org-src-fontify-natively t)

;;自动补齐()成对
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(global-hungry-delete-mode)

(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)
(put 'dired-find-alternate-file 'disabled nil)

;;如果不require dired 会提示找不到dired-mode-map
;;(require 'dired)
;; with-eval-after-load 表示在加载dired之后才运行下边的命令。这里避免启动慢问题
;;(with-eval-after-load 'dired)
;;(define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)

;; C-x C-j就可以打开当前buffer的dired
(require 'dired-x)
