(define (=zeor? n) (apply-generic '=zeor? n))

; scheme number
(define (install-scheme-number-package)
  ; ...
  (define (scheme-number-zero? n) (= n 0))
  ;...
  (put '=zero? 'scheme-number scheme-number-zero?)
  'done)

; rational
(define (install-rational-package)
  ; ...
  (define (rational-zero? n) (= (numer n) 0))
  ;...
  (put '=zero? 'rational rational-zero?)
  'done)

; complex
(define (install-complex-package)
  ;...
  (define (complex-zero? n) (= (magnitude n) 0))
  ;...
  (put '=zero? 'complex complex-zero?)
  'done)