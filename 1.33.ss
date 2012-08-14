(define (filtered-accumulate filter combiner null-value term a next b)
  (cond ((> a b) null-value)
        ((filter a)
         (combiner (term a)
                   (filtered-accumulate filter combiner 
                                        null-value term (next a) next b)))
        (else 
         (filtered-accumulate filter combiner 
                              null-value term (next a) next b))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (square n) (* n n))
(define (divides? a b)
  (= (remainder b a) 0))

(define (next test-divisor)
  (if (= test-divisor 2) 
      3
      (+ test-divisor 2)))
   
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (prime? n)
  (if (= n (smallest-divisor n))
      n
      (smallest-divisor n)))

(define (sum-of-prime a b)
  (define (sum-term n) n)
  (define (sum-next n) (+ n 1))
  (filtered-accumulate prime? + 0 sum-term a sum-next b))

(sum-of-prime 15 100)