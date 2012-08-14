(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) 
                (accumulate combiner null-value term (next a) next b))))

(define (pi-product a b)
  (define (pi-term n)
    (cond ((= n 1) (/ 2.0 3.0))
          ((even? n) (/ (+ n 2) (+ n 1)))
          (else (/ (+ n 1) (+ n 2)))))
  (define (pi-next n)
    (+ n 1))
  (* (accumulate * 1 pi-term a pi-next b) 4))