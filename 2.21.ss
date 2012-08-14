(define (square-list-1 items)
  (define square
    (lambda (x) (* x x)))
  (if (null? items)
      (list)
      (cons (square (car items)) (square-list-1 (cdr items)))))

(define (square-list-2 items)
  (map (lambda (x) (* x x))
       items))