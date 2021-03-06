(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? x y)
    (< (abs (- x y)) tolerance))
  (define (try guess)
    (display "-> ")
    (display guess)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          guess
          (try next))))
  (try first-guess))

(define (average x y)
  (/ (+ x y) 2))

; Noraml approach
(fixed-point (lambda (x) (/ (log 1000) (log x))) 2.0)
(newline)

; Using average damping
(fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 2.0)
