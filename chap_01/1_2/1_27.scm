;; Exercise 1.27: Demonstrate that the Carmichael numbers listed in
;; Footnote 1.47 really do fool the Fermat test. That is, write a proce-
;; dure that takes an integer n and tests whether a n is congruent to
;; a modulo n for every a < n , and try your procedure on the given
;; Carmichael numbers.

;; Fermat test
(load "prime.scm")
(load "exp.scm")
(define (expmod base exp m)
  (cond ((= exp 0)
         1)
        ((even? exp)
         (remainder
          (square
           (expmod base (/ exp 2) m))
          m))
        (else
         (remainder
          (* base
             (expmod base (- exp 1) m))
          m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (fool-test n a)
  (cond
   ((>= a n) #t)
   ((not (= (remainder (fast-expt a n) n) a)) #f)
   (else (fool-test n (+ a 1)))))

(define (non-fool-test n a)
  (cond
   ((>= a (- n 1)) #t)
   ((not (= (remainder (fast-expt a n) n) 1)) #f)
   (else (non-fool-test n (+ a 1)))))

(define (fool n)
  (let ((result (fool-test n 2)))
    (when result
      (prime? n))))

(map fool '(561 1105 1729 2465 2821 6601))
;; => (#f #f #f #f #f #f)
