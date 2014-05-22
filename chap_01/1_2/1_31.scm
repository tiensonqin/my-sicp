;; Exercise 1.31:
;; a. The sum procedure is only the simplest of a vast number of
;; similar abstractions that can be captured as higher-order94
;; procedures.51 Write an analogous procedure called product
;; that returns the product of the values of a function at points
;; over a given range. Show how to define factorial in terms of
;; product. Also use product to compute approximations to π
;; using the formula52
;; π 2 · 4 · 4 · 6 · 6 · 8...
;; =
;; .
;; 4 3 · 3 · 5 · 5 · 7 · 7...
;; b. If your product procedure generates a recursive process, write
;; one that generates an iterative process. If it generates an itera-
;; tive process, write one that generates a recursive process.

(define (product f a b)
  (if (> a b)
      1
      (* (f a) (product f (+ a 1) b))))

(define (factorial n)
  (product + 1 n))

(define (up x)
  (if (= (remainder x 2) 0)
      (/ (+ 2 x) (- (+ 2 x) 1))
      (/ (+ 1 x) (+ 1 (+ 1 x)))))

(define (get-pi n)
  (* 4 (product up 1.0 n)))

(define (iter-product f a b acc)
  (if (> a b)
      acc
      (iter-product f (+ a 1) b (* (f a) acc))))

;; (iter-product + 1 4 1)
