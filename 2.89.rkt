(define (install-thin-poly-package)
  (define (make-poly variable term-list)
    (cons variable term-list))
  (define (variable p) (car p))
  (define (term-list p) (cdr p))
  (define (empty-termlist? l) (null? l))
  (define (the-empty-list) '())
  (define (first-term l) (car l))
  (define (rest-terms l) (cdr l))
   
(define (add-poly p1 p2)
    (if (same-variable? (variable p1) (variable p2))
        (make-poly (variable p1)
                   (add-terms (term-list p1)
                              (term-list p2)))
        (error "Polys not in same var -- ADD-POLY" (list p1 p2))))
  (define (mul-poly p1 p2)
    (if (same-variable? (variable p1) (variable p2))
        (make-poly (variable p1)
                   (mul-terms (term-list p1)
                              (term-list p2)))
        (error "Polys not in same var -- MUL-POLY" (list p1 p2))))
  
  (define (add-terms l1 l2)
    (cond ((empty-termlist? l1) l2)
          ((empty-termlist? l2) l1)
          (else
           (cond ((= (length l1) (length l2))
                  (accumulate-n add 0 (list l1 l2)))
                 ((> (length l1) (length l2))
                  (cons (car l1) (add-terms (cdr l1) l2)))
                 ((< (length l1) (length l2))
                  (cons (car l2) (add-terms l1 (cdr l2))))))))
  
  (define (mul-terms l1 l2)
    (if (or (empty-termlist? l1) (empty-termlist? l2))
        (the-empty-list)
        (add-terms (mul-term-by-all-terms
                    (first-term l1) (- (length l1) 1) l2)
                   (mul-terms (rest-terms l1) l2))))
  (define (get-result order terms)
           (if (= order 0)
               terms
               (get-result (- order 1) (append terms (list 0)))))
  (define (mul-term-by-all-terms t1 order terms)
    
    (if (empty-termlist? terms)
        (the-empty-list)
        (let ((undone-result (map (lambda (x) (mul x t1)) terms)))
           (get-result order undone-result))))
  
  'done)
         
    
  
  