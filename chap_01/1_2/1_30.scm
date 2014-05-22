;; Exercise 1.30: The sum procedure above generates a linear recur-
;; sion. The procedure can be rewritten so that the sum is performed
;; iteratively. Show how to do this by filling in the missing expressions
;; in the following definition:
(load "sum.scm")

;; iterative
(define (iter-asum f a b acc)
  (if (> a b)
      acc
      (iter-asum f (+ a 1) b (+ (f a) acc))))
