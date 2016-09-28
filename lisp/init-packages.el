(provide 'init-packages)
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)

;;(setq package-selected-packages 'zoujieorg/packages)
(defvar zoujieorg/packages '(
			     company
			     monokai-theme
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

