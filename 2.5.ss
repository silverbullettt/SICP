(define (fast-exp b n)
  (cond ((= n 0) 1)
        ((odd? n) (* b (fast-exp b (- n 1))))
        (else (fast-exp ((lambda (x) (* x x)) b) (/ n 2)))))

(define (cons a b)
  (define (dispatch m)
    (cond ((= m 0) (fast-exp 2 a))
          ((= m 1) (fast-exp 3 b))
          (else (error "Argument not 0 or 1 --CONS" m))))
  dispatch)

(define (car z) (z 0))
(define (cdr z) (z 1))