
(defvar ths/packages '())
(setf ths/packages
      '(ido-vertical-mode
	ido-ubiquitous
	ido-at-point
	flx
	flx-ido

	web-mode
	skewer-mode

	desktop
	smartparens
	;; ido-yes-or-no

	expand-region

	magit
	))

(defun ths/ensure-packages (skip-refresh)
  "Installs packages from `ths/packages' that are not installed.

Does not upgrade packages if already installed. Given prefix
argument, does not refresh package list first."
  (interactive "P")
  (unless skip-refresh
    (package-refresh-contents))
  (cl-loop for p in ths/packages
	   unless (package-installed-p p)
	   do (package-install p)))

(provide 'setup-packages)


