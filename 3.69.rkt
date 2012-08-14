(load "stream.rkt")
(load "3.66.rkt")

(define (triples s t u)
  (cons-stream
   (list (stream-car s) (stream-car t) (stream-car u))
   (interleave
    (stream-map (lambda (pair) (cons (stream-car s) pair))
                (stream-cdr (pairs t u)))
    (triples (stream-cdr s) (stream-cdr t) (stream-cdr u)))))

(define (pythagoras-triple? triple)
  (define (square x) (* x x))
  (if (null? triple)
      #f
      (let ((i (car triple))
            (j (cadr triple))
            (k (caddr triple)))
        (= (+ (square i) (square j)) (square k)))))

(define pythagoras-triples
  (stream-filter pythagoras-triple?
                 (triples integers integers integers)))