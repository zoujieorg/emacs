;;Add melpa repository to archives

(package-initialize)

;;系统自带的包
(require 'org)

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
