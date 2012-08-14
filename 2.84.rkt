(define (tag x) (car x))
(define level-list
  (list (list 'complex 4) (list 'real 3) (list 'rational 2) (list 'integer 1)))

(define (get-level x l-list)
  (cond ((null? l-list) (error "No this type -- x" x))
        ((let ((first-item (car l-list)))
           (eq? (tag x) (car first-item))
           (cdr first-item)))
        (else
         (get-level x (cdr l-list)))))

(define (compare-level x1 x2)
  (- (get-level x1 level-list) (get-level x2 level-list)))

(define (eq-level? x1 x2) 
  (= (compare-level x1 x2) 0))
(define (higher-level? x1 x2)
  (> (compare-level x1 x2) 0))
(define (lower-level? x1 x2)
  (< (compare-level x1 x2) 0))

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (if (= (length args) 2)
              (let ((a1 (car args)) (a2 (cdr args)) (type1 (car args)))
                (cond ((eq-level? a1 a2)
                       ((get op (type1 type1)) a1 a2))
                      ((higher-level? a1 a2)
                       (apply-generic op a1 (raise a2)))
                      ((lower-level? a1 a2)
                        (apply-generic op (raise a1) a2)))
                      (else
                       (error "No method for these types"
                              (list op type-tags))))
              (error "No method for these types"
                     (list op type-tags)))))))