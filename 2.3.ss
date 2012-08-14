(define (make-rectangle p1 p2)
  (cons p1 p2))
(define (p1 r) (car r))
(define (p2 r) (cdr r))

(define (make-point x y)
  (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (circum r)
  (* (+ (abs (- (x-point (p1 r)) (x-point (p2 r))))
        (abs (- (y-point (p1 r)) (y-point (p2 r)))))
     2))

(define (area r)
  (* (abs (- (x-point (p1 r)) (x-point (p2 r))))
     (abs (- (y-point (p1 r)) (y-point (p2 r))))))

(define r1
  (make-rectangle (make-point 4 5)
                  (make-point 8 2)))

(circum r1)
(area r1)