(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))
(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)
(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))

(define 3-pairs (list 1 2 3))
(define 4-pairs 
  (let ((p (cons (list 1) (list 2))))
    (set-cdr! (car p) (cdr p))
    p))
(define infinite-pairs (make-cycle (list 1 2 3)))