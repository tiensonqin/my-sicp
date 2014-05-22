;; *Exercise 1.13:* Prove that Fib(n) is the closest integer to
;; phi^n / sqrt(5), where phi = (1 + sqrt(5)) / 2.  Hint: Let
;; illegiblesymbol = (1 - sqrt(5))/2.  Use induction and the
;; definition of the Fibonacci numbers (see section *Note 1-2-2::) to
;; prove that Fib(n) = (phi^n - illegiblesymbol^n) / sqrt(5).

(define (pow x n)
  (if (= n 1)
      x
      (* x (pow x (- n 1)))))

(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1))
                 (fib (- n 2))))))

(define phi (/ (+ 1 (sqrt 5)) 2))
(define ph (/ (- 1 (sqrt 5)) 2))
;; (define (ci n) (/ (pow phi n) (sqrt 5)))

(define (diff n)
  (inexact->exact (floor (/ (- (pow phi n) (pow ph n)) (sqrt 5)))))

if (fib n) = (diff n)

(fib (+ n 1)) = (diff (+ n 1))
