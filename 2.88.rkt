(define (negative x) (apply-generic 'negative x))

; scheme number
(define (scheme-number-negative x) (- x))
(put 'negative 'scheme-number scheme-number-negative)

; rational
(define (rational-negative x)
  (make-rational (- (numer x)) (denom x)))
(put 'negative 'rational rational-negative)

; complex
(define (complex-negative x)
  (make-from-real-imag (- (real-part x))
                       (- (imag-part x))))
(put 'negative 'complex complex-negative)

; polynomial
(define (nega-item x)
    (make-term (order x)
               (negative (coeff x))))
(define (poly-negative term)
  (make-poly (variable term)
             (map neag-item (term-list term))))
(define (sub-terms l1 l2)
  (add l1 (map neag-item l2)))
(put 'negative 'polynomial poly-negative)