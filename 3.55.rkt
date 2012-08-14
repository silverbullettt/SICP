(load "stream.rkt")

(define (partial-sums stream)
  (cons-stream
   (stream-car stream)
   (add-streams (stream-cdr stream) (partial-sums stream))))
