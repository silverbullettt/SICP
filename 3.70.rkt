(load "3.66.rkt")

(define (merge-weighted s1 s2 weight)
  (let ((s1car (stream-car s1))
        (s2car (stream-car s2))
        (s1rest (stream-cdr s1))
        (s2rest (stream-cdr s2)))
    (if (> (weight s1car) (weight s2car))
        (cons-stream s2car
                     (cons-stream s1car
                                  (merge-weighted s1rest s2rest weight)))
        (cons-stream s1car
                     (cons-stream s2car
                                  (merge-weighted s1rest s2rest weight))))))

(define (weighted-pairs s1 s2 weight)
  (let ((strm1 (stream-map
                (lambda (x) (list (stream-car s1) x))
                (stream-cdr s2)))
        (strm2 (pairs (stream-cdr s1) (stream-cdr s2))))
    (cons-stream (list (stream-car s1) (stream-car s2))
                 (merge-weighted strm1 strm2 weight))))

(define (integer-weight pair)
  (+ (car pair) (cadr pair)))

(define integer-pairs
  (weighted-pairs integers integers integer-weight))