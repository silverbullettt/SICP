(define (raise x)
  (if (eq? (tag x) 'complex)
      #f
      (apply-generic 'raise x)))

; integer
(define (install-integer-package)
  ; ...
  (define (integer-raise x) (make-rational x 1))
  ;...
  (put 'raise 'integer integer-raise)
  'done)

; rational
(define (install-rational-package)
  ; ...
  (define (rational-raise x) 
    (make-real (/ (numer x) (denom x))))
  ;...
  (put 'raise 'rational rational-raise)
  'done)

; real
(define (install-real-package)
  ;...
  (define (real-raise x) 
    (make-complex-from-real-imag x 0))
  ;...
  (put 'raise 'real real-raise)
  'done)