Exercise 1.33: You can obtain an even more general version of
accumulate (Exercise 1.32) by introducing the notion of a filter
on the terms to be combined. That is, combine only those terms
derived from values in the range that satisfy a specified condition.
The resulting filtered-accumulate abstraction takes the same
arguments as accumulate, together with an additional predicate
of one argument that specifies the filter.
Write filtered-
accumulate as a procedure. Show how to express the following
using filtered-accumulate:
a. the sum of the squares of the prime numbers in the interval a to
b (assuming that you have a prime? predicate already written)
b. the product of all the positive integers less than n that are
relatively prime to n (i.e., all positive integers i < n such that
                             GCD(i , n ) = 1).

(load "prime.scm")
(load "gcd.scm")
(define (accumulate f base term a b predicate)
  (if (> a b)
      base
      (if (predicate a)
          (term (f a) (accumulate f base term (+ a 1) b predicate))
          (accumulate f base term (+ a 1) b predicate))))

(define (square x) (* x x))
(accumulate square 0 + 1 10 prime?)

(define (identical x)
  x)


(define (rprime? i)
  (= (gcd i 10) 1))

(accumulate identical 1 * 1 10 rprime?)
