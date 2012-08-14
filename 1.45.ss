(define (iterative-improve check improve guess)
  (if (check guess)
      guess
      (iterative-improve check improve (improve guess))))

(define (_sqrt x guess)
  (define square
    (lambda (x) (* x x)))
  (define (average x y)
    (/ (+ x y) 2))
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.0001))
  (define (improve guess)
    (average guess (/ x guess)))
  (iterative-improve good-enough? improve guess))

(_sqrt 9 1.0)

(define (fixed-point f first-guess)
  (define tolerance 0.00001)
  (define (good-enough? guess)
    (< (abs (- guess (f guess))) tolerance))
  (iterative-improve good-enough? f first-guess))

(fixed-point cos 1.0)