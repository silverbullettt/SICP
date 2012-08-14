(define random-init 1)

(define rand
  (let ((x random-init))
  (define generate
    (lambda ()
      (set! x (rand-update x))
      x))
  (define reset
    (lambda (n)
      (set! x n)))
  (define (dispatch m)
    (cond ((eq? m 'generate) generate)
          ((eq? m 'reset) reset)
          (else (error "Unknown request -- RAND" m))))
    dispatch))
  
 
