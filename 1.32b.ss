(define (accumulate combiner null-value term a pre b)
  (if (> a b)
      null-value
      (combiner (accumulate combiner null-value term a pre (pre b)) 
                (term b))))

(define (sum-integral a b)
  (define (sum-term n) n)
  (define (sum-pre n) (- n 1))
  (accumulate + 0 sum-term a sum-pre b))