(define (cycle? x)
  (define (iter list)
    (cond ((or (null? list) (not (pair? list))) #f)
          ((or (eq? x (cdr list)) (cycle? (car list))) #t)
          (else
           (iter (cdr list)))))
  (iter x))