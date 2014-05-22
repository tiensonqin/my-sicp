;; Exercise 1.22: Most Lisp implementations include a primitive
;; called runtime that returns an integer that specifies the amount
;; of time the system has been running (measured, for example,
;;                                                in microseconds). The following timed-prime-test procedure,
;; when called with an integer n , prints n and checks to see if n is
;; prime. If n is prime, the procedure prints three asterisks followed
;; by the amount of time used in performing the test.

;; Using this procedure, write a procedure search-for-primes that
;; checks the primality of consecutive odd integers in a specified
;; range. Use your procedure to find the three smallest primes larger
;; than 1000; larger than 10,000; larger than 100,000; larger than
;; 1,000,000. Note the time needed to test each prime. Since the
;; testing algorithm has order of growth of Θ( n ), you should expect
;; that testing for primes around 10,000 should take about 10 times
;; as long as testing for primes around 1000. Do your timing data
;; bear this out? How well do the data for 100,000 and 1,000,000
;; support the Θ( n ) prediction? Is your result compatible with the
;; notion that programs on your machine run in time proportional
;; to the number of steps required for the computation?

(load "prime.scm")
(define (search-for-primes start end)
  (let ((begin-time (current-inexact-milliseconds)))
    (if (even? start)
        (search-for-primes (+ start 1) end)
        (cond ((< start end) (timed-prime-test start)
               (search-for-primes (+ start 2) end))))
    (- (current-inexact-milliseconds) begin-time)))
;; (define (search-for-primes start end)
;;   (if (even? start)
;;       (search-for-primes (+ start 1) end)
;;       (cond ((< start end) (timed-prime-test start)
;;              (search-for-primes (+ start 2) end)))))

(define (even? n)
  (= (remainder n 2) 0))

(define (timed-prime-test n)
  (newline) (display n) (start-prime-test n (current-inexact-milliseconds)))
(define (start-prime-test n start-time)
  (when (prime? n)
    (report-prime (- (current-inexact-milliseconds) start-time))))
(define (report-prime elapsed-time)
  (display " *** ") (display elapsed-time))

(search-for-primes 1000 10000)

(search-for-primes 10000 100000)
