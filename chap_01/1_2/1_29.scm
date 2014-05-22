;; Exercise 1.29: Simpson’s Rule is a more accurate method of numer-
;; ical integration than the method illustrated above. Using Simp-
;; son’s Rule, the integral of a function f between a and b is approxi-
;; mated as
;; h
;; ( y 0 + 4 y 1 + 2 y 2 + 4 y 3 + 2 y 4 + . . . + 2 y n−2 + 4 y n−1 + y n ),
;; 3
;; where h = (b − a )/n , for some even integer n , and y k = f (a + kh ).
;; (Increasing n increases the accuracy of the approximation.) Define
;; a procedure that takes as arguments f , a , b , and n and returns the
;; value of the integral, computed using Simpson’s Rule. Use your
;; procedure to integrate cube between 0 and 1 (with n = 100 and n =
;; 1000), and compare the results to those of the integral procedure
;; shown above.
(load "sum.scm")


(define (cube x)
  (* x x x))

(define (simpson-integral f a b n)
  (let ((h (/ (- b a) n)))
    (define (fi k)
      (let* ((result (f (+ a (* k h))))
             (prefix (cond
                      ((or (= k 0) (= k n)) 1)
                      ((= 0 (remainder k 2)) 4)
                      (else 2))))
        (* prefix result)))
    (* (/ h 3) (asum fi 1 (+ n 1)))))

(simpson-integral cube 0 1.0 100)
;; 0.2535853400000002
(simpson-integral cube 0 1.0 1000)
;; 0.25033583533399945
;; (simpson-integral cube 0 1.0 10000)
;; 0.2500333583353332
