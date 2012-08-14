(define (make-queue)
  (let ((queue (cons '() '()))
        (front-ptr car)
        (rear-ptr cdr)
        (set-front-ptr! set-car!)
        (set-rear-ptr! set-cdr!))
    
    (define (empty-queue? queue) (null? (front-ptr queue)))
    
    (define (front-queue)
      (if (empty-queue? queue)
          (error "FRONT called with an empty queue" queue)
          (car (front-ptr queue))))
    
    (define (insert-queue! item)
      (let ((new-pair (cons item '())))
        (cond ((empty-queue? queue)
               (set-front-ptr! queue new-pair)
               (set-rear-ptr! queue new-pair)
               queue)
              (else
               (set-cdr! (rear-ptr queue) new-pair)
               (set-rear-ptr! queue new-pair)
               queue))))
    
    (define (delete-queue!)
      (cond ((empty-queue? queue)
             (error "DELETE! called with an empty queue" queue))
            (else
             (set-front-ptr! queue (cdr (front-ptr queue))
             queue))))
    
    (define (print-queue) (display (car queue)))
    
    (define (dispatch m)
      (cond ((eq? m 'insert-queue!) insert-queue!)
            ((eq? m 'delete-queue!) delete-queue!)
            ((eq? m 'front-queue) front-queue)
            ((eq? m 'print-queue) print-queue)
            (else (error "Unknown request -- MAKE-QUEUE" m))))
    
    dispatch))

(define q1 (make-queue))
          