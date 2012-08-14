(define (square x) (* x x))

(define (expmod base exp m)
  (cond ((= (remainder (square base) m) 1) 0)
        ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (miller-rabin-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) (remainder 1 n)))
  (try-it (+ 1 (random (- n 1)))))

(define (prime? n times)
  (cond ((= times 0) true)
        ((miller-rabin-test n) (prime? n (- times 1)))
        (else false)))

(prime? 6601 100)