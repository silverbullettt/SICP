(define (make-segment s e)
  (cons s e))

(define (start-segment l) (car l))
(define (end-segment l) (cdr l))

(define (make-point x y)
  (cons x y))

(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (mid-point l)
  (make-point (/ (+ (x-point (start-segment l)) (x-point (end-segment l))) 2.0)
              (/ (+ (y-point (start-segment l)) (y-point (end-segment l))) 2.0)))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(print-point(mid-point (make-segment (make-point 4 5) (make-point 8 2))))