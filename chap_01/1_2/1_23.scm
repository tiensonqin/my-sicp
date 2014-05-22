;; Exercise 1.23: The smallest-divisor procedure shown at the
;; start of this section does lots of needless testing: After it checks to
;; see if the number is divisible by 2 there is no point in checking to
;; see if it is divisible by any larger even numbers. This suggests that
;; the values used for test-divisor should not be 2, 3, 4, 5, 6, . . . ,
;; but rather 2, 3, 5, 7, 9, . . . . To implement this change, define a pro-
;; cedure next that returns 3 if its input is equal to 2 and otherwise
;; returns its input plus 2. Modify the smallest-divisor procedure
;; to use (next test-divisor) instead of (+ test-divisor 1).
;; With timed-prime-test incorporating this modified version of
;; smallest-divisor, run the test for each of the 12 primes found
;; in Exercise 1.22. Since this modification halves the number of
;; test steps, you should expect it to run about twice as fast. Is this
;; expectation confirmed? If not, what is the observed ratio of the
;; speeds of the two algorithms, and how do you explain the fact that
;; it is different from 2?

(define (square x) (* x x ))

(define (smallest-divisor n) (find-divisor n 2))

(define (next n) (if (= n 2) 3 (+ n 2)))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (divides? a b) (= (remainder b a) 0))

;; Fermat test
(define (expmod base exp m)
  (cond ((= exp 0)
         1)
        ((even? exp)
         (remainder
          (square
           (expmod base (/ exp 2) m))
          m))
        (else
         (remainder
          (* base
             (expmod base (- exp 1) m))
          m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (even? n)
  (= (remainder n 2) 0))

(define (timed-prime-test n)
  (newline) (display n) (start-prime-test n (current-inexact-milliseconds)))
(define (start-prime-test n start-time)
  (when (fast-prime? n 1)
    (report-prime (- (current-inexact-milliseconds) start-time))))
(define (report-prime elapsed-time)
  (display " *** ") (display elapsed-time))

(define (search-for-primes start end)
  (let ((begin-time (current-inexact-milliseconds)))
    (if (even? start)
        (search-for-primes (+ start 1) end)
        (cond ((< start end) (timed-prime-test start)
               (search-for-primes (+ start 2) end))))
    (- (current-inexact-milliseconds) begin-time)))

(search-for-primes 10000 100000)
;; 17.42

(search-for-primes 10000 100000)
;; 148

;; (search-for-primes 10000 11000)
;; 1.73
