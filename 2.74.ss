(define (install-branch-package)
  (define branch-file
    (list 'branch ('branch name salary)))
  (define (make-employee name salary)
    (list 'branch name salary))
  (define (name employee-record) (cadr employee-record))
  (define (salary employee-record) (caddr employee-record))
  (define (find-employee-record name)
    (define (find-record-iter name file)
        (if (null? file)
            (error "NO FOUND -- BRANCH" name)
            (let ((first-record (car file)))
              (if (eq? name (name first-record))
                  first-record
                  (find-record-iter name (cdr file))))))
    (find-record-iter name (cdr branch-file)))
  
  (put 'name '(branch) name)
  (put 'salary '(branch) salary)
  (put 'find-employee-record '(branch) find-employee-record)
  (put 'make-employee '(branch)
       (lambda (name salary) (make-employee name salary)))
  'done)

; a)
(define (get-record name file-name)
  ((get 'find-emloyee-record file-name) name))

; b)
(define (get-salary name file-name)
  (let ((record (get-record name file-name)))
    ((get 'salary file-name) record)))

; c)
(define (find-employee-record name file)
  (let ((first-file-name (caar file)))
    (let ((emp-record (get name first-file-name)))
      (if emp-record
          emp-record
          (find-employee-record name (cdr file))))))
      
            
      