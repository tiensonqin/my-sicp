(define (factorial n)
  (fact-iter 1 1 n))

(define (fact-iter counter i n)
  (if (> i n)
      counter
      (fact-iter (* counter i) (+ i 1) n)))

(factorial 4)
