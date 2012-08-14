(define (product term a pre b)
  (if (> a b)
      1
      (* (product term a pre (pre b)) (term b))))

(define (pi-product a b)
  (define (pi-term n)
    (cond ((= n 1) (/ 2.0 3.0))
          ((even? n) (/ (+ n 2) (+ n 1)))
          (else (/ (+ n 1) (+ n 2)))))
  (define (pi-pre n)
    (- n 1))
  (* (product pi-term a pi-pre b) 4))