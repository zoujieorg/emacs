;;let emacs to find excutable command
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;;common-lisp-mode
(require 'cl)

;;recentf相关
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)


(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'init-packages)
(require 'init-functions)
(require 'init-better-defaults)
(require 'init-keybindings)
(require 'init-org)
(require 'init-ui)

;;以下2行与(require 'init-custom) 同效
(setq custom-file (expand-file-name "lisp/init-custom.el" user-emacs-directory))
(load-file custom-file)
;;当外部修改了emacs的配置文件后，emacs会自动更新修改。
(global-auto-revert-mode t)

(set-language-environment "UTF-8")

;;如取消息定的包管理则要添加
;;(require 'cask "~/.cask/cask.el")
;;(cask-initialize)
;;(require 'pallet)
;;(pallet-mode t)


(pp (macroexpand `(use-package xxx
		    :init
		    (progn
		      (setq my-name "zoujie")
		      (setq my-age 33)
		      )
		    :config
		    (setq my-dog "peter")
		    :commands
		    (global-company-mode)
		    :defer t
		    :bind 
		    (("M-s O" . moccur)
		     :map isearch-mode-map
		    ("M-o" . isearch-moccur))
		 )))
