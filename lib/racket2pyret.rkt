#lang racket

; BS1 -> pyret compiler

(provide bs1->pyret
         pyret->string
         bs1->pyret-string
         bs1-string->pyret-string
         format-simple-bs1-as-pyret
         format-pyret-arglist
         )

;--------- PYRET AST -----------
(define-struct pyatom (a))
(define-struct pybinop (b l r))
(define-struct pyfun (name args body))
(define-struct pyask-clause (test then))
(define-struct pyask (clauses))
(define-struct pyexample (in out))
(define-struct pyapp (fname args))

;--------- BINOPS --------------
(define binop-table
  '((+ plus)
    (- minus)
    (* times)
    (/ div)))

(define (lookup-binop b)
  (second (assq b binop-table)))

(define (atom? v) (not (list? v)))

;; function to format simple (one-line) expressions in pyret
;; supports atoms, binops, and application over simple bs1 expressions
(define (format-simple-bs1-as-pyret sexp)
  (cond [(atom? sexp) sexp] 
        [else 
         (case (first sexp)
           [(+ - * /) (format "~a(~s, ~s)"
                              (lookup-binop (first sexp)) 
                              (format-simple-bs1-as-pyret (second sexp)) 
                              (format-simple-bs1-as-pyret (third sexp)))]
           [(define cond example) 
            (error 'format-simple-bs1-as-pyret "Given non-simple bs1 ~a~n" sexp)]
           [else ;; function application
            (let ([fname (first sexp)]
                  [args (rest sexp)])
              (format "~a(~a)" fname (format-pyret-arglist args)))]
           )]))

;; given list of simple racket args, convert to pyret arglist
;;   function constructs format string manually to preserve string quotations
(define (format-pyret-arglist args)
  (let ([argfmt (string-join (map (lambda (a) (if (string? a) "~s" "~a")) args) ", ")])
    (apply format (cons argfmt (map format-simple-bs1-as-pyret args))))) 

(define (bs1->pyret sexp)
  (cond [(atom? sexp) (make-pyatom sexp)]
        [else 
         (case (first sexp)
           [(+ - * /) (make-pybinop (first sexp) (bs1->pyret (second sexp)) (bs1->pyret (third sexp)))]
           [(define) (let ([defname (first (second sexp))]
                           [args (second (second sexp))]
                           [body (third sexp)])
                       (make-pyfun defname args (bs1->pyret body)))]
           [(cond) (let* ([clauses (rest sexp)]
                          [pyret-clauses 
                           (map (lambda (c) (make-pyask-clause (bs1->pyret (first c)) (bs1->pyret (second c))))
                                clauses)])
                     (make-pyask pyret-clauses))]
           [(example) (let ([testexpr (second sexp)]
                            [output (third sexp)])
                        (make-pyexample (bs1->pyret testexpr) (bs1->pyret output)))]
           [else ;; function application
            (let ([fname (first sexp)]
                  [args (rest sexp)])
              (make-pyapp fname (map bs1->pyret args)))]
           )]))

(define (pyret->string pyast)
  (cond [(pyatom? pyast) (let ([a (pyatom-a pyast)])
                           (if (string? a) a (format "~a" a)))]
        [(pybinop? pyast) (format "~a(~a, ~a)" 
                                  (lookup-binop (pybinop-b pyast)) 
                                  (pyret->string (pybinop-l pyast)) 
                                  (pyret->string (pybinop-r pyast)))]
        [(pyfun? pyast) (format "fun ~a(~a): ~n ~a ~nend" 
                                (pyfun-name pyast) 
                                (pyfun-args pyast)
                                (pyret->string (pyfun-body pyast)))]
        [(pyask-clause? pyast) (format " | ~a => ~a~n"
                                       (pyret->string (pyask-clause-test pyast))
                                       (pyret->string (pyask-clause-then pyast)))]
        [(pyask? pyast) (format "ask: ~n ~a ~nend" (string-join (map pyret->string (pyask-clauses pyast)) " "))]
        [(pyexample? pyast) (format "~a is ~a"
                                    (pyret->string (pyexample-in pyast))
                                    (pyret->string (pyexample-out pyast)))]
        [(pyapp? pyast) (format "~a(~a)" 
                                (pyapp-fname pyast)
                                (string-join (map pyret->string (pyapp-args pyast)) ", "))]
        [else (error 'pyret->string "Unknown ast ~a~n" pyast)]))
        
(define (bs1->pyret-string sexp)
  (pyret->string (bs1->pyret sexp)))

(define (bs1-string->pyret-string sexpstr) 
  (bs1->pyret-string (with-input-from-string sexpstr read)))

;; TESTS
(define (test-bs1->pyret expr)
  (display (pyret->string (bs1->pyret expr)))
  (printf "~n~n"))

(define (test-fmt-simple expr)
  (display (format-simple-bs1-as-pyret expr))
  (printf "~n~n"))

(define (run-tests)
  (test-bs1->pyret 3)
  (test-bs1->pyret '(+ 2 3))
  (test-bs1->pyret '(define (f x) (+ x 2)))
  (test-bs1->pyret '(example (f x) (+ x 2)))
  (test-bs1->pyret '(cond [(* 4 5) "cake"] [else "pizza"]))
  )

(define (run-simple-fmt-tests)
  (test-fmt-simple 4)
  (test-fmt-simple "hello")
  (test-fmt-simple "hello, world")
  (test-fmt-simple '(+ 3 5))
  (test-fmt-simple '(string=? "a" b))
  (test-fmt-simple '(string=? "a" "b"))
  (test-fmt-simple '(f (g 4)))
  (test-fmt-simple '(f (g "abba")))
  (test-fmt-simple '(string=? (g "cake") "pie"))
  )
      