(defpackage backlight
  (:use :cl)
  (:export :main))
(in-package :backlight)

(defparameter *max-brightness-path*
  #p"/sys/class/backlight/intel_backlight/max_brightness")

(defparameter *brightness-path*
  #p"/sys/class/backlight/intel_backlight/brightness")

(defvar *quit-on-error-p* t)

(defun main ()
  (flet ((syntax-error ()
	   (format t "Syntax error~%Usage: backlight <percent>~%")
	   (if *quit-on-error-p*
	       (uiop:quit)
	       (return-from main))))
    (unless (= (length uiop:*command-line-arguments*) 1) (syntax-error))
    (let ((percent (parse-integer (car uiop:*command-line-arguments*)
				  :junk-allowed t)))
      (unless (and percent (< 0 percent) (<= percent 100)) (syntax-error))
      (let* ((max (parse-integer (read-file-into-string *max-brightness-path*)))
	     (result (format nil "~d" (round (/ (* percent max) 100)))))
	(write-string-into-file result *brightness-path* :if-exists :supersede)))))
