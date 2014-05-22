(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1))
                 (fib (- n 2))))))

(define (fib n)
  (fib-iter 1 0 n))

(define (fib-iter next prev n)
  (if (= n 0)
      prev
      (fib-iter (+ next prev) next (- n 1))))
