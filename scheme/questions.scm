(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))

; Some utility functions that you may find useful to implement.

(define (cons-all first rests)
  (if (null? rests)
    nil
    (cons (cons first (car rests)) (cons-all first (cdr rests)))
  )
)

(define (zip pairs)
  (define (helper1 pairs)
    (if (null? pairs)
      nil
      (cons (caar pairs) (helper1 (cdr pairs)))
    )
  )
  (define (helper2 pairs)
    (if (null? pairs)
      nil
      (cons (car (cdar pairs)) (helper2 (cdr pairs)))
    )
  )
  (list (helper1 pairs) (helper2 pairs))
)

;; Problem 16
;; Returns a list of two-element lists
(define (enumerate s)
  ; BEGIN PROBLEM 16
  (define (helper s num)
    (if (null? s)
      nil
      (cons (list num (car s))
            (helper (cdr s) (+ num 1)))
    )
  )
  (helper s 0)
  )
  ; END PROBLEM 16

;; Problem 17
;; List all ways to make change for TOTAL with DENOMS
(define (list-change total denoms)
  ; BEGIN PROBLEM 17
  (if (null? denoms)
    nil
    (if (= total (car denoms))
      (append (cons (cons total nil) nil) (list-change total (cdr denoms)))
      (if (< total (car denoms))
        (list-change total (cdr denoms))
        (append (cons-all (car denoms) (list-change (- total (car denoms)) denoms))
          (list-change total (cdr denoms))
        )
      )
    )
  )
)
  ; END PROBLEM 17

;; Problem 18
;; Returns a function that checks if an expression is the special form FORM
(define (check-special form)
  (lambda (expr) (equal? form (car expr))))

(define lambda? (check-special 'lambda))
(define define? (check-special 'define))
(define quoted? (check-special 'quote))
(define let?    (check-special 'let))

;; Converts all let special forms in EXPR into equivalent forms using lambda
(define (let-to-lambda expr)
  (cond ((atom? expr)
         ; BEGIN PROBLEM 18
         expr
         ; END PROBLEM 18
         )
        ((quoted? expr)
         ; BEGIN PROBLEM 18
         expr
         ; END PROBLEM 18
         )
        ((or (lambda? expr)
             (define? expr))
         (let ((form   (car expr))
               (params (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM 18
           (cons form (cons params (map let-to-lambda body)))
           ; END PROBLEM 18
           ))
        ((let? expr)
         (let ((values (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM 18
           (define args (zip values))
           (append (list (append (list 'lambda (car args)) (map let-to-lambda body))) (map let-to-lambda (cadr args)))
           ; END PROBLEM 18
           ))
        (else
         ; BEGIN PROBLEM 18
         (cons (car expr) (map let-to-lambda (cdr expr)))
         ; END PROBLEM 18
         )))
