(define (split-at lst n)
  'YOUR-CODE-HERE
  (define (helper res lst n)
    (if (= 0 n)
      (cons res lst)
      (if (null? lst)
        (cons res lst)
        (helper (append res (list (car lst))) (cdr lst) (- n 1))
      )
    )
  )
  (helper nil lst n)
)


(define-macro (switch expr cases)
  (cons 'cond
    (map (lambda (case) (cons (list 'eq? expr (car case)) (cdr case)))
          cases))
)
(define x 'b)
(switch x (('a (print 'a))
                ('b (print 'b))
                ('c (print 'c))))
