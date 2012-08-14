(define (last_pair items)
  (if (null? items)
      (error "Empty list")
      (let ((n (length items)))
        (if (= n 1)
            items
            (last_pair (cdr items))))))