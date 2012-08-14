(define (cubic-iter guess x)
  (if (good-enough? guess x)
      guess
      (cubic-iter (improve guess x) x)))

(define (improve guess x)
  (/ (+ (/ x (* guess guess))
        (* 2 guess))
     3))
 
(define (good-enough? guess x)
  (< (abs (- 1
             (/ guess (improve guess x))))
     0.00001))
  
 (define (cubic x)
   (cubic-iter 1.0 x))
 
 (cubic 8)