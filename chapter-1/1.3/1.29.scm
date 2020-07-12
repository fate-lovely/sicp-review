;;Exercise 1.29
;;Using Simpson's Rule to computer integral
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (even? x)
  (= (remainder x 2) 0))

(define (simpson-integral f a b n)
  (define h (/ (- b a) n))
  (define (yk k)
    (f (+ a (* k h))))
  (define (term k)
    (cond
     ((or (= k 0) (= k n)) (yk k))
     ((even? k) (* 2 (yk k)))
     (else (* 4 (yk k)))))
  (define (inc x) (+ x 1))
  (* (/ h 3.0)
     (sum term 0 inc n)))

(define (cube x)
  (* x x x))

(display (simpson-integral cube 0 1 100))
(display "\n")
(display (simpson-integral cube 0 1 1000))
(display "\n")