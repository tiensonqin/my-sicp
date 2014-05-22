;; *Exercise 1.7:* The `good-enough?' test used in computing square
;; roots will not be very effective for finding the square roots of
;; very small numbers.  Also, in real computers, arithmetic operations
;; are almost always performed with limited precision.  This makes
;; our test inadequate for very large numbers.  Explain these
;; statements, with examples showing how the test fails for small and
;; large numbers.  An alternative strategy for implementing
;; `good-enough?' is to watch how `guess' changes from one iteration
;; to the next and to stop when the change is a very small fraction
;; of the guess.  Design a square-root procedure that uses this kind
;; of end test.  Does this work better for small and large numbers?

(define (abs x)
  (if (< x 0)
      (- x)
      x))

(define (square x)
  (* x x))

(define (good-enough? test last)
  (<= (abs (- test last)) 0.001))

(define (square-root x test last)
  (if (good-enough? test last)
      test
      (square-root x (/ (+ test (/ x test)) 2) test)))

;; (square-root 0.000000000000000000000000000000000000000001 1.0 0)
;; => 0.03125

;; (square-root 143200000000000000000000000 1.0 0)
;; => no return

(square-root 100 1.0 0)
