;; go-mode - major-mode
;; flymake-go - flymake support for go
;; go-eldoc - requires gocode

;; gocode
;; requires auto-complete
(add-to-list 'load-path "~/dev/go/src/github.com/nsf/gocode/emacs")
(require 'go-autocomplete)
(require 'auto-complete-config)


;; look at go-errcheck maybe


(defun setup-golang-mode ()
  (add-hook 'before-save-hook #'gofmt-before-save)
  (flycheck-mode)
  (electric-indent-local-mode -1)
  (local-set-key (kbd "C-c i") #'go-import-add)
  (add-hook 'go-mode-hook 'go-eldoc-setup))

;; TODO set some key for:
;; go-import-add
;; go-remove-unused-imports

(add-hook 'go-mode-hook #'setup-golang-mode)

;; golang-doc
;; golang-go.tools
;; golang-go.tools-dev
;; golang-go.net-dev
;; golang-mode

(provide 'setup-go)
