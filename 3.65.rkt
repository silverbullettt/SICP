(load "stream.rkt")
(load "3.55.rkt")

; first sequence, never optimize
(define (ln2-summands n)
  (cons-stream (/ 1.0 n)
               (stream-map - (ln2-summands (+ n 1)))))

(define ln2-stream
  (partial-sums (ln2-summands 1)))

; second sequence, use euler transform once
(define square (lambda (x) (* x x)))

(define (euler-transform s)
  (let ((s0 (stream-ref s 0))
        (s1 (stream-ref s 1))
        (s2 (stream-ref s 2)))
    (cons-stream (- s2 (/ (square (- s2 s1))
                          (+ s0 (* -2 s1) s2)))
                 (euler-transform (stream-cdr s)))))

(define euler-ln2-stream
  (euler-transform ln2-stream))

; third sequence, use super accelerator
(define (make-tableau transform s)
  (cons-stream s
               (make-tableau transform 
                             (transform s))))

(define (accelerated-sequence transform s)
  (stream-map stream-car
              (make-tableau transform s)))

(define accelerated-ln2-stream
  (accelerated-sequence euler-transform ln2-stream))

; test
(display-stream-n ln2-stream 8)
(display-stream-n euler-ln2-stream 8)
(display-stream-n accelerated-ln2-stream 8)

; first sequence convergences very slowly
; second sequence convergences faster and faster than first sequence
; third sequence convergences very very very fast