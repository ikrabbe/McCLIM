(cl:defpackage #:clim-tests
  (:use
   #:clim-lisp
   #:clim
   #:clime
   #:fiveam)

  (:export
   #:run-tests))

(cl:in-package #:clim-tests)

(def-suite :mcclim)

(defun run-tests ()
  (run!))
