(define (install-polynomial-package)
  ; ...
  (define (poly-zero? term)
    (define (iter-zero? list)
      (if (null? list)
          #t
          (let ((first-item (car list)))
            (and (=zero? (coeff first-item))
                 (iter-zero? (cdr list))))))
    (iter-zero? (term-list term)))
  ; ...
  (put '=zero? 'polynomial poly-zero?)
  'done)