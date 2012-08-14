(define (make-leaf symbol weight)
  (list 'leaf symbol weight))

(define (leaf? object)
  (eq? (car object) 'leaf))

(define (symbol-leaf x) (cadr x))

(define (weight-leaf x) (caddr x))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))

(define (left-branch tree) (car tree))

(define (right-branch tree) (cadr tree))

(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))

(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(define (encode-symbol sym tree)
  (if (eq? (member sym (symbols tree)) #f)
      (error "Symbel not in tree -- " sym)
      (let ((r-b (right-branch tree))
            (l-b (left-branch tree)))
        (if (member sym (symbols l-b))
            (if (leaf? l-b) (list 0) (cons 0 (encode-symbol sym l-b)))
            (if (leaf? r-b) (list 1) (cons 1 (encode-symbol sym r-b)))))))

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set)
                    (adjoin-set x (cdr set))))))

(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
        (adjoin-set (make-leaf (car pair)    ; symbol
                               (cadr pair))  ; frequency
                    (make-leaf-set (cdr pairs))))))

(define (generate-huffman-tree pairs)
  (car (successive-merge (make-leaf-set pairs))))

;; iteration
(define (successive-merge pairs) 
  (if (= (length pairs) 1)
      pairs
      (successive-merge (adjoin-set
                         (make-code-tree (car pairs) (cadr pairs)) 
                         (cddr pairs)))))

(define lyric-tree 
  (generate-huffman-tree '((A 2) (NA 16) (BOOM 1) (SHA 3) (GET 2) (YIP 9) (JOB 2) (WAH 1))))

(define lyrics '(GET A JOB
                     SHA NA NA NA NA NA NA NA NA
                     GET A JOB
                     SHA NA NA NA NA NA NA NA NA
                     WAH YIP YIP YIP YIP YIP YIP YIP YIP YIP
                     SHA BOOM))

(display (encode lyrics lyric-tree))