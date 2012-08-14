(define (repeated f n)
  (if (= n 1)
      f
      (compose (repeated f (- n 1)) f)))

(define square
  (lambda (x) (* x x)))

((repeated square 2) 5)