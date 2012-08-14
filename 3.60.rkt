(load "stream.rkt")

(define (mul-series s1 s2)
  (cond ((stream-null? s1) the-empty-stream)
        ((stream-null? s2) the-empty-stream)
        (else
         (cons-stream (* (stream-car s1) (stream-car s2))
                      (add-streams (scale-stream (stream-cdr s2)
                                                 (stream-car s1))
                                   (mul-series (stream-cdr s1) s2))))))

