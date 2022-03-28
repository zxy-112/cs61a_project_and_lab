(define (cddr s) (cdr (cdr s)))

(define (cadr s) 'YOUR-CODE-HERE (car (cdr s)))

(define (caddr s) 'YOUR-CODE-HERE (car (cddr s)))

(define (sign num)
  'YOUR-CODE-HERE
  (cond ((< num 0) -1)
        ((= num 0) 0)
        (else 1)
  )
)

(define (square x) (* x x))

(define (pow x y)
  'YOUR-CODE-HERE
  (cond ((= y 1) x)
        ((= y 0) 1)
        (else
          (if (even? y)
            (square (pow x (/ y 2)))
            (* x (pow x (- y 1)))
          )
        )
  )
)

(define (unique s)
  'YOUR-CODE-HERE
  (cond ((null? s) ())
        (else
          (define except (car s))
          (cons (car s)
                (unique (filter
                          (lambda (x) (not (equal? x (car s))))
                          (cdr s)
                        )
                )
          )
        )
  )
)

(define (replicate x n)
  'YOUR-CODE-HERE
  (define (helper res n)
    (cond ((= n 0) res)
          (else
            (helper (append res (list x)) (- n 1))
          )
    )
  )
  (helper '() n)
)

(define (accumulate combiner start n term)
  'YOUR-CODE-HERE
  (define (helper res num)
    (cond ((> num n) res)
          (else
            (helper (combiner res (term num)) (+ num 1))
          )
    )
  )
  (helper start 1)
)

(define (accumulate-tail combiner start n term)
  'YOUR-CODE-HERE
  (define (helper res num)
    (cond ((> num n) res)
          (else
            (helper (combiner res (term num)) (+ num 1))
          )
    )
  )
  (helper start 1)
)

(define-macro
  (list-of map-expr for var in lst if filter-expr)
  ''YOUR-CODE-HERE
  `(map (lambda (,var) ,map-expr) (filter (lambda (,var) ,filter-expr) ,lst))
)
