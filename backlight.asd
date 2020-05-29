(defsystem "backlight"
  :version "0.1.0"
  :author "Lars Engblom"
  :license "MIT"
  :depends-on ("alexandria")
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description ""
  :build-operation "program-op" ;; leave as is
  :build-pathname "backlight"
  :entry-point "backlight:main"	
  :in-order-to ((test-op (test-op "backlight/tests"))))

(defsystem "backlight/tests"
  :author "Lars Engblom"
  :license "MIT"
  :depends-on ("backlight"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for backlight"
  :perform (test-op (op c) (symbol-call :rove :run c)))
