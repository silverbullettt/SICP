(load "stream.rkt")

; generic the 2^n list
(define s (cons-stream 1 (add-stream s s)))

