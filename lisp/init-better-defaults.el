(package-initialize)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(electric-indent-mode -1)
(setq inhibit-splash-screen t)
(global-linum-mode t)
(setq-default cursor-type 'bar)

(defun open-my-init-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(provide 'init-better-defaults)
