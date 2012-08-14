(load "stream.rkt")

(define (stream-limit s tolerance)
  (cond ((stream-null? s) '())
        ((< (abs (- (stream-ref s 0) (stream-ref s 1))) tolerance)
         (stream-car s))
        (else
         (stream-limit (stream-cdr s) tolerance))))