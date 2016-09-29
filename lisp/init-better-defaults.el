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

;;smartparens相关的一些设置
;;对于smartparens 取消一部分major mode中的一些符号自动匹配.
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)

;;在语句中间时仍然可以显示所在的括号
;;(define-advice show-paren-function (:around (fn) fix-show-paren-function)
;;  "Hightlight enclosing parens."
;;  (cond ((looking-at-p "\\s(") (function fn))
;;	(t (save-excursion
;;	     (ignore-errors (backward-up-list))
;;	     (funcall fn)))))

(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)
(put 'dired-find-alternate-file 'disabled nil)

;;如果不require dired 会提示找不到dired-mode-map
;;(require 'dired)
;; with-eval-after-load 表示在加载dired之后才运行下边的命令。这里避免启动慢问题
;;(with-eval-after-load 'dired)
;;(define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)

;; C-x C-j就可以打开当前buffer的dired

;;occur
;;; dwim "do what I mean"
(defun occur-dwim ()
  "Call 'occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
	    (buffer-substring-no-properties
	     (region-beginning)
	     (region-end))
	  (let ((sym (thing-at-point 'symbol)))
	    (when (stringp sym)
	      (regexp-quote sym))))
	regexp-history)
  (call-interactively 'occur))

(global-set-key (kbd "M-s o") 'occur-dwim)
(global-set-key (kbd "M-s i") 'counsel-imenu)
(global-set-key (kbd "M-s e") 'iedit-mode)

(require 'dired-x)
