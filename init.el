 ;;Add melpa repository to archives

(package-initialize)

;;let emacs to find excutable command
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


;;系统自带的包
(require 'org)
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
(require 'init-custom)
(require 'init-ui)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.08)
 '(company-minimum-prefix-length 1))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
