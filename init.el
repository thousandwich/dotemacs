;; this is uh, until we get to emacs 24.5 I guess
(unless (fboundp 'function-put)
  (defalias 'function-put 'put))

;;; Weird init.ec
(load-file "~/.emacs.d/init.ec")
(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/site-lisp")

;;; Package Setup
;; (package-initialize t) to not activate all packages on startup
(package-initialize)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/"))

;;; Basic Customization
;;; Global Modes

;; (show-paren-mode t) ; using smartparen
(desktop-save-mode 1)

(require 'smartparens-config)
;; required for loading mode-specific setup
;; like not pairing ' in lisp modes
(smartparens-global-mode 1)
(show-smartparens-global-mode 1)
(recentf-mode 1)

(require 'setup-packages)
(require 'setup-look-and-feel)
(require 'setup-ido)

(require 'setup-org)
(require 'setup-c)
(require 'setup-go)
(require 'setup-lisp)
(require 'setup-scheme)
(require 'setup-clojure)
(require 'setup-haskell)

(global-set-key (kbd "C-s") #'isearch-forward-regexp)
(global-set-key (kbd "C-M-s") #'isearch-forward)
(global-set-key (kbd "C-r") #'isearch-backward-regexp)
(global-set-key (kbd "C-M-r") #'isearch-backward)
(global-set-key (kbd "M-%") #'query-replace-regexp)
(global-set-key (kbd "C-M-%") #'query-replace)
(global-set-key (kbd "C-=") 'er/expand-region)
;; unsure of what to bind to
;; (global-set-key (kbd "") 'recentf-open-files)

;;; Setting up auto-complete
(require 'auto-complete-config)
(ac-config-default)




;;; Util functions used in this file
(defun symb (&rest args)
  "Create a symbol from the arguments"
  (intern (apply 'concat (mapcar (apply-partially 'format "%s") args))))

;; (defmacro make-interactive (&body body)
;;   (lambda (&rest args)
;;     (interactive)
;;     (apply fn args)))

;;; Global Keybindings
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x C-k") 'kill-region)
(global-set-key (kbd "C-x C-m") 'smex)
(global-set-key (kbd "s-,")
		(lambda ()
		  (interactive)
		  (find-file "~/.emacs.d/init.el")))
(global-set-key (kbd "s-.")
		(lambda ()
		  (interactive)
		  (switch-to-buffer "*scratch*")))
(global-unset-key (kbd "C-x m"))


(mapc (lambda (dir)
	(global-set-key (kbd (format "<%s>" dir))
			(symb "windmove-" dir)))
      '(left right up down))
      
;;; Mode Specific Setup

(defmacro foo/setup-mode (mode &rest body)
  (declare (indent 1))
  (let ((name (symb 'setup- mode))
	(hook (symb mode '-hook)))
    `(progn
       (defun ,name ()
	 ,@body
	 'ok)
       (add-hook ',hook ',name))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(org-pretty-entities t)
 '(org-use-sub-superscripts (quote {})))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-level-1 ((t (:inherit variable-pitch :foreground "#cb4b16" :height 1.0))))
 '(org-level-2 ((t (:inherit variable-pitch :foreground "#859900" :height 1.0))))
 '(org-level-3 ((t (:inherit variable-pitch :foreground "#268bd2" :height 1.0))))
 '(org-level-4 ((t (:inherit variable-pitch :foreground "#b58900" :height 1.0)))))

(defun ths/yank-and-indent (&optional arg)
  (interactive)
  (let ((start (point)))
    (yank arg)
    (indent-region start (point))))

(global-set-key (kbd "C-S-y") 'ths/yank-and-indent)


;; modes

;; (add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))



