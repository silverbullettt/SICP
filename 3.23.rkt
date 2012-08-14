;; make deque by double list

(define (make-deque)
  (let ((deque (cons '() '()))
        (front-ptr car)
        (rear-ptr cdr)
        (set-front-ptr! set-car!)
        (set-rear-ptr! set-cdr!))
    
    (define (empty-deque? deque)
      (null? (front-ptr deque)))
    
    (define (front-deque) 
      (if (empty-deque? deque)
          (error "FRONT called witn an empty deque" deque))
          (car (front-ptr deque)))
    
    (define (rear-deque) 
      (if (empty-deque? deque)
          (error "REAR called witn an empty deque" deque)
          (car (rear-ptr deque))))
    
    (define (front-insert-deque! item)
      (let ((new-pair (cons item (cons '() '()))))
        (cond ((empty-deque? deque)
               (set-front-ptr! deque new-pair)
               (set-rear-ptr! deque new-pair)
               (print-deque))
              (else
               (set-cdr! (cdr (front-ptr deque)) new-pair)
               (set-car! (cdr new-pair) (front-ptr deque))
               (set-front-ptr! deque new-pair)
               (print-deque)))))
                          
    (define (rear-insert-deque! item)
      (let ((new-pair (cons item (cons '() '()))))
        (cond ((empty-deque? deque)
               (set-front-ptr! deque new-pair)
               (set-rear-ptr! deque new-pair)
               (print-deque))
              (else
               (set-car! (cdr (rear-ptr deque)) new-pair)
               (set-cdr! (cdr new-pair) (rear-ptr deque))
               (set-rear-ptr! deque new-pair)
               (print-deque)))))

    (define (front-delete-deque!)
      (cond ((empty-deque? deque)
             (error "DELETE called with an empty deque" deque))
            ((eq? (front-ptr deque) (rear-ptr deque))
             (set-front-ptr! deque '())
             (set-rear-ptr! deque '())
             (print-deque))
            (else
             (set-front-ptr! deque (cadr (front-ptr deque)))
             (set-cdr! (cdr (front-ptr deque)) '())
             (print-deque))))

    (define (rear-delete-deque!)
      (cond ((empty-deque? deque)
             (error "DELETE called with an empty deque" deque))
            ((eq? (front-ptr deque) (rear-ptr deque))
             (set-front-ptr! deque '())
             (set-rear-ptr! deque '())
             (print-deque))
            (else
             (set-rear-ptr! deque (cddr (rear-ptr deque)))
             (set-car! (cdr (rear-ptr deque)) '())
             (print-deque))))
    
    (define (print-deque)
      (define (get-deque-iter queue-list ptr)
        (if (null? ptr)
            queue-list
            (get-deque-iter (append queue-list (list (car ptr)))
                            (cadr ptr))))
      (get-deque-iter '() (front-ptr deque)))
             
    (define (dispatch m)
      (cond ((eq? m 'rear-insert-deque!) rear-insert-deque!)
            ((eq? m 'front-insert-deque!) front-insert-deque!)
            ((eq? m 'rear-delete-deque!) rear-delete-deque!)
            ((eq? m 'front-delete-deque!) front-delete-deque!)
            ((eq? m 'front-deque) front-deque)
            ((eq? m 'rear-deque) rear-deque)
            ((eq? m 'print-deque) print-deque)
            (else (error "Unknown request -- MAKE-DEQUE" m))))
    
    dispatch))

(define d1 (make-deque))
((d1 'rear-insert-deque!) 'a)
((d1 'rear-insert-deque!) 'b)
((d1 'rear-insert-deque!) 'c)