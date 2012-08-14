
;--------------------------------------------------------
(require (lib "19.ss" "srfi"))
(display (current-time time-process))
(define (square x) (* x x))

(define (smallest-divisor n)
(find-divisor n 2))

(define (find-divisor n test-divisor)
(cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
        (= (remainder b a) 0))

(define (prime? n)
(= n (smallest-divisor n)))

(define (timed-prime-test n)
(newline)
(display n)
(start-prime-test n (current-time time-process)))

(define (start-prime-test n start-time)
(if (prime? n)
      (report-prime (time-difference (current-time time-process) start-time))
      #f)) ; have timed-prime-test return false

(define (report-prime elapsed-time)
  (display " *** ")
  (display (current-time time-process elapsed-time))
  (display "s ")
  (display (current-time time-process elapsed-time))
  (display "ns")
  #t)                                ; have timed-prime-test return true

(define (search-for-primes start count)
  (define checked-start (if (even? start) 
                            (+ 1 start) 
                            start))
(define (iter now count)
    (cond ((= 0 count)
           (newline)
           (display "***** FINISHED *****")
           (newline))
          ((timed-prime-test now) (iter (+ 2 now) (- count 1)))
          (else (iter (+ 2 now) count))))
(iter checked-start count))

(search-for-primes 10000000000 3)