;; *Exercise 1.16:* Design a procedure that evolves an iterative
;; exponentiation process that uses successive squaring and uses a
;; logarithmic number of steps, as does `fast-expt'.  (Hint: Using the
;; observation that (b^(n/2))^2 = (b^2)^(n/2), keep, along with the
;; exponent n and the base b, an additional state variable a, and
;; define the state transformation in such a way that the product a
;; b^n is unchanged from state to state.  At the beginning of the
;; process a is taken to be 1, and the answer is given by the value
;; of a at the end of the process.  In general, the technique of
;; defining an "invariant quantity" that remains unchanged from state
;; to state is a powerful way to think about the design of iterative
;; algorithms.)

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

;; fast linear recursive version
(define (fast-expt x times)
  (cond
   ((= times 0) 1)
   ((even? times) (square (fast-expt x (/ times 2))))
   (else (* x (fast-expt x (- times 1))))))

;; fast linear iterative version
(define (fast-expt b n a)
  (cond
   ((= n 0) a)
   ((even? n) (fast-expt (square b) (/ n 2) a))
   (else (fast-expt b (- n 1) (* a b)))))

(fast-expt 2 2 1)
