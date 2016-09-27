;;Add melpa repository to archives

(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")



(require 'init-packages)
(require 'init-functions)
(require 'init-better-defaults)
(require 'init-keybindings)
(require 'init-custom)
(require 'init-ui)
