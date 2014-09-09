(foo/setup-mode c-mode
  (c-set-style "k&r")
  (setf c-basic-offset 4
  	comment-start "// "
  	;; comment-end nil
	))

(provide 'setup-c)
