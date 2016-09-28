(provide 'init-packages)

;;melpa-stable
;;(add-to-list 'package-archives
;;	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;;melpa这里面包比较多
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)

;;(setq package-selected-packages 'zoujieorg/packages)
(defvar zoujieorg/packages '(
			     company
			     monokai-theme
			     ;;melpa-stable里没有hungry-delete
			     hungry-delete
			     ;;smex与swiper功能差不多,
			     ;;swiper依赖counsel包
			     swiper
			     counsel
			     ;;自动补齐()
			     smartparens
			     ;;javascript-mode
			     js2-mode
			     ;;nodejs-repl
			     ;;C-h v查看变量说明，需要手动进入。
			     ;;popwin会自动打开buffer并移动光标进入，按"q"自动退出
			     popwin
			     ) "Default packages")

(defun zoujieorg/packages-installed-p ()
  (loop for pkg in zoujieorg/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (zoujieorg/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg zoujieorg/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;;在使用M-x执行命令时,提供更多的提示信息
;;(require 'smex)
;;(smex-initialize)
;;(global-set-key (kbd "M-x") 'smex)

;;搜索时更加方便
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
;;(global-set-key (kbd "<f6>") 'ivy-resume)
;;(global-set-key (kbd "M-x") 'counsel-M-x)
;;(global-set-key (kbd "C-x C-f") 'counsel-find-file)
;;(global-set-key (kbd "<f1> f") 'counsel-describe-function)
;;(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
;;(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-c f") 'counsel-describe-function)
(global-set-key (kbd "C-c v") 'counsel-describe-variable)

(require 'smartparens-config)
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

;;config for nodejs-repl
;;(require 'nodejs-repl)
;; 把js直接发送到buffer里直接执行 
;; nodejs-repl-send-buffer

(require 'hungry-delete)
(global-hungry-delete-mode)

(require 'popwin)
(popwin-mode t)
