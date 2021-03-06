;; Exercise 3.6
;; Design a new rand procedure that can reset its interal state

(define (rand arg)
  (let ((x random-init-value))
    (lambda ()
      (cond
        ((eq? arg 'generate)
         (set! x (rand-update x))
         x)
        ((eq? arg 'reset)
         (lambda (new-value)
           (set! x new-value)))
        (else (error "rand can't perform such operation! " arg))))))
