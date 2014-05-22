Exercise 1.32:
a. Show that sum and product (Exercise 1.31) are both special cases
of a still more general notion called accumulate that combines a
collection of terms, using some general accumulation function:
(accumulate combiner null-value term a next b)
Accumulate takes as arguments the same term and range spec-
ifications as sum and product, together with a combiner proce-
dure (of two arguments) that specifies how the current term is
to be combined with the accumulation of the preceding terms
and a null-value that specifies what base value to use when
the terms run out. Write accumulate and show how sum and
product can both be defined as simple calls to accumulate.

b. If your accumulate procedure generates a recursive process,
write one that generates an iterative process. If it generates an
iterative process, write one that generates a recursive process.

(define (accumulate f base term a b)
  (if (> a b)
      base
      (term (f a) (accumulate f base term (+ a 1) b))))

;; (accumulate + 1 * 1 4)

;; iterative version
(define (iter-accumulate f base term a b acc)
  (if (> a b)
      (term base acc)
      (iter-accumulate f base term (+ a 1) b (term (f a) acc))))

;; (iter-accumulate + 1 * 1 4 1)
