(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

;; a. How many times is the procedure p applied when (sine
;; 12.15) is evaluated?
(define (times x count)
  (if (<= x 0.1)
      count
      (times (/ x 3.0) (+ count 1))))

(times 12.15 0)
;; => 5

;; b. What is the order of growth in space and number of steps (as a
;; function of a ) used by the process generated by the sine proce-
;; dure when (sine a) is evaluated?

;; both number of steps and space O(log n)
