#lang racket

;; test cases for the racket->pyret compiler

(require "../lib/racket2pyret.rkt")

;;;;;; TESTING HELPERS ;;;;;;;;;;;;;;

(define (test-oneline expr)
  (printf "Testing one-line: ~s ~n" expr)
  (display (format-oneline-bs1-as-pyret expr))
  (printf "~n~n"))

(define (test-multiline strLst)
  (printf "Testing multi-line: ~s ~n" strLst)
  (display (format-manyline-bs1-as-pyret strLst))
  (printf "~n~n"))

;;;;;;; TEST SUITES ;;;;;;;;;;;;;;;;;;;

(define (run-oneline-tests)
  (test-oneline 4)
  (test-oneline "hello")
  (test-oneline "hello, world")
  (test-oneline '(+ 3 5))
  (test-oneline '(string=? "a" b))
  (test-oneline '(string=? "a" "b"))
  (test-oneline '(f (g 4)))
  (test-oneline '(f (g "abba")))
  (test-oneline '(string=? (g "cake") "pie"))
  (test-oneline '(define (f x) (+ x 2)))
  (test-oneline '(example (f x) (+ x 2)))
  (test-oneline '(example (f "hi" "mom") (string=? "hi" "mom")))
  (test-oneline '(example (tax 2500) (* .15 (- 2500 1000))))
  (test-oneline '(cond [(* 4 5) "cake"] [else "pizza"]))
  )
   
(define (run-multiline-tests)
  (test-multiline '("(+ 2 3)"))
  (test-multiline '("(define (f x)" "(+ x 3))"))
  (test-multiline '("; a comment" "(define (f x)" "(+ x 3))"))
  (test-multiline '("; a comment" "; a second comment" "3"))
  (test-multiline '("(cond [(= 3 4) 5]" "[(> 6 7) 8]" ")"))
  (test-multiline '("(cond [(string=? x \"hi\") \"mom\"]" "[(> 6 7) \"dad\"]" ")"))
  (test-multiline '("(cond [(string=? x \"hi\") (string=? y \"mom\")]" "[(> 6 7) \"dad\"]" ")"))
  (test-multiline '("; here are tests" "(EXAMPLE 5 5)" "(EXAMPLE 7 8)"))
  (test-multiline '("; here are tests" "(EXAMPLE 5 5)" "(EXAMPLE 7 8)" "(define x 9)"))
  (test-multiline '("; comment before cond" "(cond [(string=? x \"hi\") \"mom\"]" "[(> 6 7) \"dad\"]" ")"))

  )