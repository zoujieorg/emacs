(provide 'init-packages)

(package-initialize)
;;melpa-stable
;;(add-to-list 'package-archives
;;	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;;melpa这里面包比较多
;;(add-to-list 'package-archives
;;	     '("melpa" . "https://melpa.org/packages/") t)

;;国内源
(when (>= emacs-major-version 24)
  (setq package-archives '(("popkit" . "http://elpa.popkit.org/packages/")
			   ))
  )

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
			     web-mode
			     js2-refactor
			     expand-region
			     iedit
			     org-pomodoro
			     helm-ag
			     flycheck
			     auto-yasnippet
			     ;;evil 使用vi快捷键方式
			     window-numbering
			     powerline
			     which-key
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
       '(("\\.js\\'" . js2-mode)
	 ("\\.html\\'" . web-mode)
	 )
       auto-mode-alist))

;;config for nodejs-repl
;;(require 'nodejs-repl)
;; 把js直接发送到buffer里直接执行 
;; nodejs-repl-send-buffer

(require 'hungry-delete)
(global-hungry-delete-mode)

(require 'popwin)
(popwin-mode t)

;; web-mode
(defun my-toggle-web-indent ()
  (interactive)
  ;; web development
  (if (or (eq major-mode 'js-mode) (eq major-mode 'js2-mode))
      (progn
	(setq js-indent-level (if (= js-mode-level 2) 4 2))
	(setq js2-basic-offset (if (= js2-basic-offset 2) 4 2))))
  (if (eq major-mode 'web-mode)
      (progn 
	(setq web-mode-markup-indent-offset (if (= web-mode-markup-indent-offset 2) 4 2))
	(setq web-mode-css-indent-offset (if (= web-mode-css-indent-offset 2) 4 2))
	(setq web-mode-code-indent-offset (if (= web-mode-code-indent-offset 2) 4 2))))
  (if (eq major-mode 'css-mode)
      (setq css-indent-offset (if (= css-indent-offset 2) 4 2)))
  (setq indent-tabs-mode nil))

(global-set-key (kbd "C-c t i") 'my-toggle-web-indent)

(defun my-web-mode-indent-setup ()
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  )

(add-hook 'web-mode-hook 'my-web-mode-indent-setup)

;; config for js2-refactor-mode
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-m")

(global-set-key (kbd "C-=") 'er/expand-region)
(require 'org-pomodoro)

;;(global-flycheck-mode t)
(add-hook 'js2-mode-hook 'flycheck-mode)

(require 'yasnippet)
(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)

;;(evil-mode 1)
;;(seqt evil-want-C-u-scroll t)

(window-numbering-mode t)

;;使用M-1,M-2切换窗口，注意在powerline模式下无法看到窗口编号。
(setq window-numbering-assign-func
      (lambda () (when (equal (buffer-name) "*Calculator*") 9)))

;;(require 'powerline)
;;(powerline-default-theme)

;;(require 'which-key)
(which-key-mode 1)
(setq which-key-side-window-max-height 0.25)
