(define (sum-integers a b)
  (if (> a b)
      0
      (+ a (sum-integers (+ a 1) b))))

(define (cube a)
  (* a a a))

(define (sum-cubes a b)
  (if (> a b)
      0
      (+ (cube a) (sum-cubes (+ a 1) b))))

(define (pi a)
  (let ((b (+ 1 (* 4 (- a 1)))))
    (/ 1 (* b (+ b 2)))))

(define (sum-pi a b)
  (if (> a b)
      0
      (+ (pi a) (sum-pi (+ a 1) b))))

(define (asum f a b)
  (if (> a b)
      0
      (+ (f a) (asum f (+ a 1) b))))
