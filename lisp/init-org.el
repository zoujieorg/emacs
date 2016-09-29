(provide 'init-org)


;;系统自带的包

(require 'org-install)
(require 'ob-tangle)
;;(org-babel-load-file (expand-file-name "zoujie.org" user-emacs-directory))

(with-eval-after-load 'org
  (setq org-src-fontify-natively t)
  (setq org-agenda-files '("~/.emacs.d/org"))

  (setq org-capture-templates
	'(("t" "Todo" entry (file+headline "~/.emacs.d/org/gtd.org" "工作安排")
	   "* TODO [#B] %?\n %i\n"
	   :empty-lines 1))
	
	)
  )
;; r = remember
(global-set-key (kbd "C-c r") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)
