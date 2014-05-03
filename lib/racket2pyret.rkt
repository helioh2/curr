#lang racket

; BS1 -> pyret compiler

(provide ;bs1->pyret
         ;pyret->string
         bs1->pyret-string
         bs1-string->pyret-string
         format-simple-bs1-as-pyret
         format-oneline-bs1-as-pyret
         format-manyline-bs1-as-pyret
         format-pyret-arglist
         lookup-binop
         )

;--------- PYRET AST -----------
(define-struct pyatom (a))
(define-struct pybinop (b l r))
(define-struct pyfun (name args body))
(define-struct pyask-clause (test then))
(define-struct pyask (clauses))
(define-struct pyexample (in out))
(define-struct pyapp (fname args))
(define-struct pyconst (name val))

;--------- BINOPS --------------
(define binop-table
  '((+ plus)
    (- minus)
    (* times)
    (/ div)))

(define (lookup-binop b)
  (let ([find (assq b binop-table)])
    (if find (second find) #f)))

(define (atom? v) (not (list? v)))

;; function to format simple (one-line) expressions in pyret
;; supports atoms, binops, and application over simple bs1 expressions
(define (format-simple-bs1-as-pyret sexp)
  (cond [(atom? sexp) sexp] 
        [else 
         (case (first sexp)
           [(+ - * /) (format "~a(~a)" 
                              (lookup-binop (first sexp))
                              (format-pyret-arglist (rest sexp)))]
           [(example)
            (format "~s is ~s" 
                    (format-simple-bs1-as-pyret (second sexp))
                    (format-simple-bs1-as-pyret (third sexp)))]
           [(define) 
            (if (atom? (second sexp)) 
                (if (string? (third sexp))
                    (format "~a = ~s" (second sexp) (third sexp))
                    (format "~a = ~a" (second sexp) (third sexp)))
                (format "fun ~a(~a): ~s end"
                        (first (second sexp)) 
                        (string-join (map ~a (rest (second sexp))) ", ")
                        (format-simple-bs1-as-pyret (third sexp))))]
           [(cond)
            (error 'format-simple-bs1-as-pyret "Given non-simple bs1 ~a~n" sexp)]
           [else ;; function application
            (let ([fname (first sexp)]
                  [args (rest sexp)])
              (format "~a(~a)" fname (format-pyret-arglist args)))]
           )]))

;; need better handling of binop arglists -- could be strings
(define (format-bs1-as-pyret sexp #:multi-line? (multi-line? #f))
  (define (format-help sexp)
    (cond [(atom? sexp) sexp] 
          [else 
           (case (first sexp)
             [(+ - * /) (format "~a(~a)" 
                                (lookup-binop (first sexp))
                                (format-pyret-arglist (rest sexp)))]
             [(example)
              (format "~s is ~s" 
                      (format-help (second sexp))
                      (format-help (third sexp)))]
             [(define) 
              (cond [(atom? (second sexp)) ; defining a constant
                     (if (string? (third sexp))
                         (format "~a = ~s" (second sexp) (third sexp))
                         (format "~a = ~a" (second sexp) (third sexp)))]
                    [else ; defining a function
                     (let ([fmtstr (if multi-line? 
                                       "fun ~a(~a):~n ~s ~nend" 
                                       "fun ~a(~a): ~s end")])
                       (format fmtstr
                               (first (second sexp)) 
                               (string-join (map ~a (rest (second sexp))) ", ")
                               (format-help (third sexp))))])]
             [(cond)
              (if multi-line?
                  ;; using format-bs1-as-pyret rather than format-help on clause components to reset multiline
                  (let ([clauses (rest sexp)])
                    (format "ask:~n~a ~nend" 
                            (string-join (map (lambda (c) 
                                                (format " | ~a => ~s"
                                                        (format-bs1-as-pyret (first c)) 
                                                        (format-bs1-as-pyret (second c))))
                                              clauses)
                                         "\n")))
                  (error 'format-bs1-as-pyret "Cond cannot be formatted for single line: ~a~n" sexp))]
             [else ;; function application
              (let ([fname (first sexp)]
                    [args (rest sexp)])
                (format "~a(~a)" fname (format-pyret-arglist args)))]
             )]))
  (formatted-pyret->string (format-help sexp)))

;; given list of simple racket args, convert to pyret arglist
;;   function constructs format string manually to preserve string quotations
(define (format-pyret-arglist args)
  (let ([argfmt (string-join (map (lambda (a) (if (string? a) "~s" "~a")) args) ", ")])
    (apply format (cons argfmt (map format-simple-bs1-as-pyret args))))) 

(define (formatted-pyret->string pycode)
  (if (string? pycode) pycode (~a pycode)))

; check whether first character in string is semicolon (racket comment char)
(define (racket-comment? str)
  (string=? ";" (substring str 0 1)))

(define (curr-comment-char) "#")

;; converts racket comment to a pyret comment
(define (format-comment-line bs1cmtstr)
  (string-replace bs1cmtstr ";" (curr-comment-char) #:all? #f))

;; consumes string of bs1 code and produces string of pyret code or #f
;;  if the bs1str cannot convert to a single line of pyret code
(define (format-oneline-bs1-as-pyret bs1str)
  (with-handlers ([exn:fail:read? (lambda (exn) #f)]
                  [(lambda (exn) #t)
                   (lambda (exn) 
                     (printf "EXN msg: ~s~n" (exn-message exn))
                     #f)])
    (cond [(string=? "\n" bs1str) bs1str] ; don't process newlines 
          [(racket-comment? bs1str) (format-comment-line bs1str)]
          [else (formatted-pyret->string (format-simple-bs1-as-pyret (with-input-from-string bs1str read)))])))

;; takes list of strings that make up one racket expression (optionally with leading comments)
;;   and produce pyret rendering as a string
;; assumes comment lines, if any, are at the top of the code segment
(define (format-manyline-bs1-as-pyret bs1strs)
  (with-handlers ([exn:fail:read? (lambda (exn) 
                                    (printf "Multiline failed to parse: ~a~n" bs1strs)
                                    "!!!!KATHI FIX ME!!!!!")]
                  [(lambda (exn) #t)
                   (lambda (exn) 
                     (printf "EXN msg: ~s~n" (exn-message exn))
                     #f)])
    (let loop ([all-lines bs1strs] [comment-lines '()])
      (if (empty? all-lines) 
          (error 'format-manyline-bs1-as-pyret "No actual code lines in ~a~n" bs1strs)
          (if (racket-comment? (first all-lines))
              (loop (rest all-lines) (cons (format-comment-line (first all-lines)) comment-lines))
              (let ([sexp (with-input-from-string (apply string-append all-lines) read)])
                (string-join (append (reverse comment-lines) 
                                     ;; need to handle newlines within the lines?
                                     (list (format-bs1-as-pyret sexp #:multi-line? #t)))
                             "\n")))))))
                    


(define (bs1->pyret sexp)
  (cond [(atom? sexp) (make-pyatom sexp)]
        [else 
         (case (first sexp)
           [(+ - * /) (make-pybinop (first sexp) (bs1->pyret (second sexp)) (bs1->pyret (third sexp)))]
           [(define) (if (list? (second sexp)) 
                         (let ([defname (first (second sexp))]
                               [args (second (second sexp))]
                               [body (third sexp)])
                           (make-pyfun defname args (bs1->pyret body)))
                         (make-pyconst (second sexp) (bs1->pyret (third sexp))))]
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
        [(pybinop? pyast) (format "~a(~s, ~s)" 
                                  (lookup-binop (pybinop-b pyast)) 
                                  (pyret->string (pybinop-l pyast)) 
                                  (pyret->string (pybinop-r pyast)))]
        [(pyfun? pyast) (format "fun ~a(~a): ~n ~s ~nend" 
                                (pyfun-name pyast) 
                                (pyfun-args pyast)
                                (pyret->string (pyfun-body pyast)))]
        [(pyask-clause? pyast) (format " | ~s => ~s~n"
                                       (pyret->string (pyask-clause-test pyast))
                                       (pyret->string (pyask-clause-then pyast)))]
        [(pyask? pyast) (format "ask: ~n ~a ~nend" (string-join (map pyret->string (pyask-clauses pyast)) " "))]
        [(pyexample? pyast) (format "~s is ~s"
                                    (pyret->string (pyexample-in pyast))
                                    (pyret->string (pyexample-out pyast)))]
        [(pyapp? pyast) (format "~a(~a)" 
                                (pyapp-fname pyast)
                                (string-join (map pyret->string (pyapp-args pyast)) ", "))]
        [(pyconst? pyast) (format "~a = ~s" (pyconst-name pyast) (pyconst-val pyast))]
        [else (error 'pyret->string "Unknown ast ~a~n" pyast)]))
        
(define (bs1->pyret-string sexp)
  (pyret->string (bs1->pyret sexp)))

(define (bs1-string->pyret-string sexpstr) 
  (with-handlers ([(lambda (exn) (exn:fail:read? exn))
                   (lambda (exn) 
                     (printf "WARNING: attempt to read bs1 from malformed string ~s~n" sexpstr)
                     sexpstr)]
                  [(lambda (exn) (exn:fail? exn))
                   (lambda (exn) (printf "~s on ~s~n" (exn-message exn) sexpstr))])
    (bs1->pyret-string (with-input-from-string sexpstr read))))

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
   
(define (test-ml strLst)
  (display (format-manyline-bs1-as-pyret strLst))
  (printf "~n~n"))

(define (run-multiline-tests)
  (test-ml '("(+ 2 3)"))
  (test-ml '("(define (f x)" "(+ x 3))"))
  (test-ml '("; a comment" "(define (f x)" "(+ x 3))"))
  (test-ml '("; a comment" "; a second comment" "3"))
  (test-ml '("(cond [(= 3 4) 5]" "[(> 6 7) 8]" ")"))
  (test-ml '("(cond [(string=? x \"hi\") \"mom\"]" "[(> 6 7) \"dad\"]" ")"))
  (test-ml '("(cond [(string=? x \"hi\") (string=? y \"mom\")]" "[(> 6 7) \"dad\"]" ")"))

  )