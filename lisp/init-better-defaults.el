;;全屏
(setq initial-frame-alist '((fullscreen . maximized)))
(tool-bar-mode -1)
(scroll-bar-mode -1)
;;关闭缩进
(electric-indent-mode -1)
(setq inhibit-splash-screen t)
(global-linum-mode t)
(setq-default cursor-type 'bar)
(global-company-mode t)
;;取消"~"结尾的自动备份文件。
(setq make-backup-files nil)
;;选择文本内容时，如有键入，则选择内容被替换
(delete-selection-mode t)

;;注释文件中的语法高亮
(setq org-src-fontify-natively t)

;;自动添加()成对
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(provide 'init-better-defaults)
