(define (make-leaf symbol weight)
  (list 'leaf symbol weight))

(define (leaf? object) (eq? (car object) 'leaf))

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
  (if (null? message )
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(define (encode-symbol symbol tree)
  (if (memq symbol (symbols tree))
      (let ((l-b (left-branch tree)) (r-b (right-branch tree)))
        (if (memq symbol (symbols l-b))
            (if (leaf? l-b) (list 0) (cons 0 (encode-symbol symbol l-b)))
            (if (leaf? r-b) (list 1) (cons 1 (encode-symbol symbol r-b)))))    
      (error "symbol not in tree --" symbol)))

(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                   (make-leaf 'B 2)
                   (make-code-tree (make-leaf 'D 1)
                                   (make-leaf 'C 1)))))

(display (encode '(A D A B B C A) sample-tree))