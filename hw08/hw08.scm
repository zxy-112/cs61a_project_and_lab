(define (helper num count lis)
  (if (null? lis)
    (list count lis)
    (if (not (equal? (car lis) num))
      (list count lis)
      (helper num (+ 1 count) (cdr-stream lis))
    )
  )
)

(define (rle s)
  'YOUR-CODE-HERE
  (if (null? s)
    nil
    (cons-stream
      (list (car s) (car (helper (car s) 0 s)))
      (rle (car (cdr (helper (car s) 0 s))))
    )
  )
)

(define (helper2 res biggest s)
  (if (null? s)
    res
    (if (< (car s) biggest)
      res
      (helper2 (append res (cons (car s) nil)) (car s) (cdr-stream s))
    )
  )
)

(define (helper3 biggest s)
  (if (null? s)
    s
    (if (< (car s) biggest)
      s
      (helper3 (car s) (cdr-stream s))
    )
  )
)

(define (group-by-nondecreasing s)
    'YOUR-CODE-HERE
    (if (null? s)
      nil
      (cons-stream (helper2 nil (car s) s) (group-by-nondecreasing (helper3 (car s) s)))
    )
)


(define finite-test-stream
    (cons-stream 1
        (cons-stream 2
            (cons-stream 3
                (cons-stream 1
                    (cons-stream 2
                        (cons-stream 2
                            (cons-stream 1 nil))))))))

(define infinite-test-stream
    (cons-stream 1
        (cons-stream 2
            (cons-stream 2
                infinite-test-stream))))

