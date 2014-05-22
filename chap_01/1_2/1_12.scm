;; *Exercise 1.12:* The following pattern of numbers is called "Pascal's
;;      triangle".

;;         1
;;       1   1
;;     1   2   1
;;   1   3   3   1
;; 1   4   6   4   1

;; The numbers at the edge of the triangle are all 1, and each number
;; inside the triangle is the sum of the two numbers above it.(4)
;; Write a procedure that computes elements of Pascal's triangle by
;; means of a recursive process.

(define (triangle x y)
  (if (or (= y 1) (= y x))
      1
      (+ (triangle (- x 1) (- y 1)) (triangle (- x 1) y))))
