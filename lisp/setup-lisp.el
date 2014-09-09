;; TODO: smartparens on, but single quotes off
;; https://github.com/Fuco1/smartparens/wiki/Pair-management

;; ;; adds `' as a local pair in emacs-lisp-mode
;; (sp-local-pair 'emacs-lisp-mode "`" "'")

;; ;; removes single quote from lisp modes (doesn't work?)
;; (sp-local-pair 'emacs-lisp-mode "'" nil :actions :rem)

(foo/setup-mode emacs-lisp-mode
  ;; don't use paredit-mode in scratch buffer, it doesn't agree
  (unless (string= (buffer-name) "*scratch*")
    ;; (paredit-mode t)
    (smartparens-strict-mode 1)))
;; trying out smartparens instead of paredit

(provide 'setup-lisp)
