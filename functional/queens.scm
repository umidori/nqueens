#!/usr/bin/env gosh

(define (range s e)
  (if (> s e)
    '()
    (cons s (range (+ s 1) e))))

(define (nqueens size)
    (define (queen n)
      (if (<= n 0)
        '(())
        (apply append
               (map (lambda (x)
                      (map (lambda (y) (cons (cons n y) x))
                           (filter (lambda (y)
                                     (and
                                       (not (memq y (map (lambda (z) (cdr z)) x)))
                                       (not (memq 0 (map (lambda (z)
                                                           (- (- n (car z)) (abs (- y (cdr z))))) x)))))
                                   (range 1 size))))
                    (queen (- n 1))))))
    (queen size))

(define (main args)
    (display
      (string-join
        (map (lambda (x)
               (string-append
                 (string-join (reverse (map (lambda (y) (number->string (cdr y))) x)))
                 "\n"))
             (nqueens (string->number (cadr args))))
        "")))
