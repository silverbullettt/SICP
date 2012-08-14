(define (deep-reverse list)
  (reverse (map reverse list)))

(define x (list (list 1 2) (list 3 4)))
