(defpackage backlight/tests/main
  (:use :cl
        :backlight
        :rove))
(in-package :backlight/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :backlight)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
