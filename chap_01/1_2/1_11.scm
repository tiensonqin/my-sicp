;; *Exercise 1.11:* A function f is defined by the rule that f(n) = n
;; if n<3 and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n>= 3.
;; Write a procedure that computes f by means of a recursive process.
;; Write a procedure that computes f by means of an iterative
;; process.

;; recursive
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))))


;; iterative
(define (f-iter n1 n2 n3 counter n)
  (if (< n 3)
      n
      (if (> counter (- n 2))
          n3
          (f-iter n2 n3 (+ n3 (* 2 n2) (* 3 n1)) (+ counter 1) n))))
