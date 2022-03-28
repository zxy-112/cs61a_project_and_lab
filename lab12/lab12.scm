
(define-macro (def func args body)
  `(define ,func (lambda ,args ,body)))


(define (map-stream f s)
  (if (null? s)
    nil
    (cons-stream (f (car s)) (map-stream f (cdr-stream s)))))

(define (ints-stream start)
  (cons-stream start (ints-stream (+ start 1))))

(define all-three-multiples
  (map-stream (lambda (x) (* 3 x)) (ints-stream 1))
)


(define (compose-all funcs)
  'YOUR-CODE-HERE
  (if (null? funcs)
    (lambda (x) x)
    (lambda (x) ((compose-all (cdr funcs)) ((car funcs) x)))
  )
)


(define (partial-sums stream)
  'YOUR-CODE-HERE
  (define (helper res stream)
    (cond ((null? stream) nil)
          (else
            (define new_res (+ res (car stream)))
            (cons-stream new_res (helper new_res (cdr-stream stream))))
          )
    )
  (helper 0 stream)
)

