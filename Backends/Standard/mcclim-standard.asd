
(defsystem #:mcclim-standard
  :depends-on (#:clim)
  :components
  ((:file "package")
   (:file "port" :depends-on ("package"))
   (:file "medium" :depends-on ("port" "package"))
   (:file "graft" :depends-on ("port" "package"))
   (:file "frame-manager" :depends-on ("medium" "port" "package"))
   (:file "mirrored-sheets" :depends-on ("package"))))
