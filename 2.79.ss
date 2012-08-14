(define (equ? n1 n2) (apply-generic 'equ? n1 n2))

; scheme number
(define (install-scheme-number-package)
  ; ...
  (define (equ? x y) (= x y))
  ;...
  (put 'equ? '(scheme-number scheme-number)
       (lambda (x y) (equ? x y)))
  'done)

; rational
(define (install-rational-package)
  ;...
  (define (equ? x y) (= (sub-rat x y) 0))
  ;...
  (put 'equ? '(rational rational)
       (lambda (x y) (equ? x y)))
  'done)

; complex
(define (install-complex-package)
  ;...
  (define (equ? x y)
    (and (= (real-part x) (real-part y))
         (= (imag-part x) (imag-part y))))  
  ;...
  (put 'equ? '(complex complex)
       (lambda (x y) (equ? x y)))
  'done)