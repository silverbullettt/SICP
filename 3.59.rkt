(load "stream.rkt")

; a)
(define (div-streams s1 s2)
  (stream-map / s1 s2))

(define (integrate-series stream)
  (div-streams stream integers))

; b)
(define cosine-series
  (cons-stream 1 (scale-stream
                  (integrate-series sine-series)
                  -1)))

(define sine-series
  (cons-stream 0 (integrate-series cosine-series)))