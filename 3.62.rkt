(load "stream.rkt")
(load "3.60.rkt")
(load "3.61.rkt")

(define (div-series s1 s2)
  (if (= (stream-car s2) 0)
      (error "CONSTANT CAN'T BE ZERO -- s2" div-series)
      (mul-series s1 (recip-seires s2))))