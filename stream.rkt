(define-syntax cons-stream
  (syntax-rules ()
    ((cons-stream obj strm)
     (cons obj (delay strm)))))

(define (stream-car strm)
  (car strm))

(define (stream-cdr strm)
  (force (cdr strm)))

(define the-empty-stream '())

(define stream-null? null?)

(define (stream-ref s n)
  (if (= n 0)
      (stream-car s)
      (stream-ref (stream-cdr s) (- n 1))))

(define (stream-for-each proc s)
  (if (stream-null? s)
      'done
      (begin (proc (stream-car s))
             (stream-for-each proc (stream-cdr s)))))

(define (display-stream s)
  (stream-for-each display-line s))

(define (display-stream-n s n)
  (define (display-iter count)
    (display-line (stream-ref s count))
    (if (< count n)
        (display-iter (+ count 1))
        'done))
  (display-iter 0))

(define (display-line x)
  (display x)
  (newline))

(define (stream-enumerate-interval low high)
  (if (> low high)
      the-empty-stream
      (cons-stream
       low
       (stream-enumerate-interval (+ low 1) high))))

(define (stream-filter pred s)
  (cond ((stream-null? s) the-empty-stream)
        ((pred (stream-car s))
         (cons-stream 
          (stream-car s)
          (stream-filter pred (stream-cdr s))))
        (else
         (stream-filter pred (stream-cdr s)))))

(define (stream . argstreams)
  (if (stream-null? (stream-car argstreams))
      the-empty-stream
      (cons-stream
       (stream-car argstreams)
       (stream (stream-cdr argstreams)))))

(define (stream-map proc . argstreams)
  (if (stream-null? (car argstreams))
      the-empty-stream
      (cons-stream
       (apply proc (map stream-car argstreams))
       (apply stream-map
              (cons proc (map stream-cdr argstreams))))))

(define (add-streams s1 s2)
  (stream-map + s1 s2))

(define (scale-stream s n)
  (stream-map (lambda (x) (* x n)) s))

(define (integers-starting-from n)
    (cons-stream n (integers-starting-from (+ n 1))))

(define integers (integers-starting-from 1))