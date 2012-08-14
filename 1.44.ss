(define dx 0.00001)

(define (repeated f n)
  (if (= n 1)
      f
      (compose (repeated f (- n 1)) f)))

(define (average x y z)
  (/ (+ x y z) 3))

(define (smooth f)
  (lambda (x)
    (average (f (- x dx))
             (f x)
             (f (- x dx)))))

(define (repeated-smooth f n)
  (repeated (smooth f) n))

((repeated-smooth sin 10) 2.5)