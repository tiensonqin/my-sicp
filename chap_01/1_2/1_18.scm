;; *Exercise 1.18:* Using the results of *Note Exercise 1-16:: and
;; *Note Exercise 1-17::, devise a procedure that generates an
;; iterative process for multiplying two integers in terms of adding,
;; doubling, and halving and uses a logarithmic number of steps.(4)

(define (double x)
  (+ x x))

(define (halve x)
  (/ x 2))

(define (* a b)
  (if (= b 0)
      0
      (+ a (* a (- b 1)))))

(define (fast*-iter a b n)
  (cond ((= b 0) n)
        ((even? b) (fast*-iter (double a) (/ b 2) n))
        (else (fast*-iter a (- b 1) (+ n a)))))
