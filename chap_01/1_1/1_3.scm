;; *Exercise 1.3:* Define a procedure that takes three numbers as
;; arguments and returns the sum of the squares of the two larger
;; numbers.

(define (square x) (* x x))

(define (sum-squares-larger-two x y z)
  (let* ((first-two (if (> x y) (list x y) (list y x)))
         (smaller (cadr first-two))
         (first (car first-two))
         (second (if (> smaller z) smaller z)))
    (+ (square first) (square second))))

;; (sum-squares-larger-two 3 4 5)
;; => 41
