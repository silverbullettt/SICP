(load "stream.rkt")

(define (show x)
  (display-line x)
  x)

(define x (stream-map show (stream-enumerate-interval 0 10)))

(stream-ref x 5)