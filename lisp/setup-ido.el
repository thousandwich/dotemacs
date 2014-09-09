;; ido-vertical-mode
;; ido-ubiquitous-mode
;; flx
;; flx-ido

(require 'ido-yes-or-no)

;; I have no idea what ido-at-point-mode does
;; I have no idea what ido-ubiquitous-mode does

;; same for ido-everywhere

(ido-mode 1)
(ido-vertical-mode 1)
(ido-everywhere 1)
(ido-ubiquitous-mode 1)
(ido-yes-or-no-mode 1)
(ido-at-point-mode 1)


(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)
(setq flx-ido-use-faces nil)

(defun recentf-ido-find-file ()
  "Find a recent file using ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))

(global-set-key (kbd "C-c f") 'recentf-ido-find-file)


(provide 'setup-ido)
