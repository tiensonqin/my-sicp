;; linear recursive version
(define (exponent x times)
  (if (= times 0)
      1
      (* x (exponent x (- times 1)))))

;; linear iterative version
(define (exponent-iter acc x times)
  (if (= times 0)
      acc
      (exponent-iter (* x acc) x (- times 1))))

(define (square x)
  (* x x))

(define (fast-expt x times)
  (cond
   ((= times 0) 1)
   ((even? times) (square (fast-expt x (/ times 2))))
   (else (* x (fast-expt x (- times 1))))))
