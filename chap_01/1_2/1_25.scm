Exercise 1.25: Alyssa P. Hacker complains that we went to a lot of
extra work in writing expmod. After all, she says, since we already
know how to compute exponentials, we could have simply written
(define (expmod base exp m)
  (remainder (fast-expt base exp) m))
Is she correct? Would this procedure serve as well for our fast prime
tester? Explain.


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

(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

(define (fast-expt x times)
  (cond
   ((= times 0) 1)
   ((even? times) (square (fast-expt x (/ times 2))))
   (else (* x (fast-expt x (- times 1))))))

not right, cause nested remainder will be ignored
