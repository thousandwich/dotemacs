(defun ths/default-theme ()
  "disables all enabled themes"
  (interactive)
  (mapc #'disable-theme custom-enabled-themes))

(defun ths/make-plain (&optional x)
  (let ((v (or x 1)))
    (blink-cursor-mode x)
    (scroll-bar-mode x)
    (menu-bar-mode x)
    (tool-bar-mode x)))

(load-theme 'solarized-dark)
(global-hl-line-mode 1)

;; turn all the menus off
(ths/make-plain -1)

(provide 'setup-look-and-feel)
