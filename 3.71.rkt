(load "3.70.rkt")

(define (cube x) (* x x x))

(define (cube-sum pair)
  (+ (cube (car pair)) (cube (cadr pair))))

(define cube-sum-stream
  (stream-map cube-sum integer-pairs))

(define ramanujan-numbers
  (stream-filter (lambda (pair) (= (car pair) (cadr pair)))
                 (stream-map list
                             cube-sum-stream
                             (stream-cdr cube-sum-stream))))

