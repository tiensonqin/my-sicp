(define (abs x)
  (if (< x 0)
      (- x)
      x))

(define (square x)
  (* x x))

(define (square-root x test end)
  (if (<= (abs (- x (square test))) end)
      test
      (square-root x (/ (+ test (/ x test)) 2) end)))

(square-root 0.000000000000000000000000000000000000000001 1 0.001)
;; => 0.03125

(square-root)
