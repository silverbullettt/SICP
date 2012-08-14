(load "stream.rkt")

(define sum 0)

(define (accum x)
  (set! sum (+ x sum))
  sum)

(define seq (stream-map accum (stream-enumerate-interval 1 20)))
sum
(define y (stream-filter even? seq))
sum
(define z (stream-filter (lambda (x) (= (remainder x 5) 0))
                         seq))
sum

(stream-ref y 7)

(display-stream z)