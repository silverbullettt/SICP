(define (smallest-divisor n)
  (find-divisor n 2))

(define (square n) (* n n))
(define (divides? a b)
  (= (remainder b a) 0))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (prime? n)
  (if (= n (smallest-divisor n))
      n
      (smallest-divisor n)))

(prime? 19999)