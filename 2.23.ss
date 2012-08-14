(define (for_each proc items)
  (if (null? items)
      nil
      ((proc (car items))
       (for_each proc (cdr items)))))