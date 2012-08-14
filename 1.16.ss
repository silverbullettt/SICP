(define (_expt b n)
  (expt-iter b 1 n))

(define (expt-iter a b count)
  (if (= count 0)
      b
      (expt-iter a (* a b) (- count 1))))

