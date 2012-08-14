(load "stream.rkt")

(define (merge s1 s2)
  (cond ((stream-null? s1) s2)
        ((stream-null? s2) s1)
        (else
         (let ((s1car (stream-car s1))
               (s2car (stream-car s2)))
           (cond ((< s1car s2car)
                  (cons-stream s1car (merge (stream-cdr s1) s2)))
                 ((> s1car s2car)
                  (cons-stream s2car (merge s1 (stream-cdr s2))))
                 (else
                  (cons-stream s1car (merge
                                      (stream-cdr s1)
                                      (stream-cdr s2)))))))))

(define s (cons-stream 1 (merge (scale-stream s 2)
                                (merge (scale-stream s 3)
                                       (scale-stream s 5)))))