(define (f-recur n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        ((= n 2) 2)
        (else (+ (f (- n 1))
                 (* 2 (f (- n 2)))
                 (* 3 (f (- n 3)))))))

(define (f-itera n)
  (f-iter 2 1 0 n))

(define (f-iter a b c count)
  (if (= count 0)
      c
      (f-iter (+ (* 3 c) (* 2 b) a)
              a b (- count 1))))

