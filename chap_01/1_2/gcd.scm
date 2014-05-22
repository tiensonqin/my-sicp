;; Greatest common divisor

(define (gcd x y)
  (if (= y 0)
      x
      (gcd y (remainder x y))))

(gcd 2 10)

(gcd 15 20)
