(load "stream.rkt")

(define (interleave s1 s2)
  (if (stream-null? s1)
      s2
      (cons-stream (stream-car s1)
                   (interleave s2 (stream-cdr s1)))))

(define (pairs s t)
  (interleave
   (stream-map (lambda (x) (list (stream-car s) x))
               t)
   (pairs (stream-cdr s) (stream-cdr t))))

(define int-pairs
  (pairs integers integers))

; can't return a value, and fall into unlimited recursion
; because interleave can't take a value from (pairs (stream-cdr s) (stream-cdr t))
