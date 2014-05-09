#lang racket

; BS1 -> pyret compiler

(require "escape-values.rkt"
         "test-generated-pyret.rkt")

(provide format-oneline-bs1-as-pyret
         format-manyline-bs1-as-pyret
         format-pyret-arglist
         lookup-binop
         curr-comment-char
         )

;--------- BINOPS --------------
(define binop-table
  '((+ plus)
    (- minus)
    (* times)
    (/ div)
    (> greater)
    (>= greatereq)
    (< less)
    (<= lesseq)
    (string=? strings-equal)
    (= nums-equal)
    (and both)
    (or either)
    ))

(define (lookup-binop b)
  (let ([find (assq b binop-table)])
    (if find (second find) #f)))

;-------------------------------

(define (atom? v) (not (list? v)))

;; need better handling of binop arglists -- could be strings
(define (format-bs1-as-pyret sexp #:multi-line? (multi-line? #f))
  (define (format-help sexp)
    (cond [(string? sexp) (if (money-escaped? sexp) (format-money sexp) (~s sexp))]
          [(atom? sexp) (let ([binop (lookup-binop sexp)])
                          (~a (or binop sexp)))]
          [else 
           (case (first sexp)
             [(EXAMPLE)
              (let ([fmtstr (if multi-line?
                                "~a is~n~a"
                                "~a is ~a")])
                (format fmtstr
                        (format-help (second sexp))
                        (format-help (third sexp))))]
             [(define) 
              (cond [(atom? (second sexp)) ; defining a constant
                     (if (string? (third sexp))
                         (format "~a = ~a" (second sexp) (third sexp))
                         (format "~a = ~a" (second sexp) (format-help (third sexp))))]
                    [else ; defining a function
                     (let ([fmtstr (if multi-line? 
                                       "fun ~a(~a):~n ~a ~nend" 
                                       "fun ~a(~a): ~a end")])
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
                                                (format " | ~a => ~a"
                                                        (format-bs1-as-pyret (first c)) 
                                                        (format-bs1-as-pyret (second c))))
                                              clauses)
                                         "\n")))
                  (error 'format-bs1-as-pyret "Cond cannot be formatted for single line: ~a~n" sexp))]
             [else ;; function application
              (let ([fname (first sexp)]
                    [args (rest sexp)])
                (let ([binop (lookup-binop (first sexp))])
                  (format "~a(~a)" (or binop fname) (format-pyret-arglist args))))]
             )]))
  (format-help sexp))

;; given list of simple racket args, convert to pyret arglist
;;   function constructs format string manually to preserve string quotations
(define (format-pyret-arglist args)
  (string-join (map format-bs1-as-pyret args) ", "))

;;;;;;;; converting comments ;;;;;;;;;;;;;;

; check whether first character in string is semicolon (racket comment char)
; input is sometimes an sexp, hence the string? guard
(define (racket-comment? str)
  (and (string? str)
       (> (string-length str) 0)
       (string=? ";" (substring str 0 1))))

(define (curr-comment-char) "#")

;; converts racket comment to a pyret comment
(define (format-comment-line bs1cmtstr)
  (string-replace bs1cmtstr ";" (curr-comment-char) #:all? #f))

;;;;;;;;; converting examples ;;;;;;;;;;;;;;

(define (racket-example? str)
  (and (> (string-length str) 8)
       (string=? "(EXAMPLE" (substring str 0 8))))

(define (format-example-line bs1examplestr #:multi-line? (multi-line? #f))
  ;(printf "formatting example ~a~n~n" bs1examplestr)
  ;(printf "reads as ~s~n~n" (with-input-from-string bs1examplestr read))
  (format-bs1-as-pyret (with-input-from-string bs1examplestr read) #:multi-line? multi-line?))
   
;; from-lines is a list of strings corresponding to a block of code
;; iterates until finding smallest number of lines that read as an example
;; returns as values the converted example string and how many lines were used
;;   to create the example
(define (read-example from-lines)
  (let loop ([try-example-str (first from-lines)] [num-used-lines 1] [rem-lines (rest from-lines)])
    (let ([complete-eg (with-handlers ([exn:fail:read? (lambda (exn) #f)])
                         (format-bs1-as-pyret (with-input-from-string try-example-str read)
                                              #:multi-line? (> num-used-lines 1)))])
      (if complete-eg 
          (begin
           ;(printf "Returning ~a from ~a lines~n" complete-eg num-used-lines)
           (values complete-eg num-used-lines))
          (if (empty? rem-lines)
              (error 'read-example "Never found complete example in ~s~n" from-lines)
              (loop (string-append try-example-str " " (first rem-lines))
                    (add1 num-used-lines)
                    (rest rem-lines)))))))
           
;;;;;;;;; exported API for rendering code ;;;;;;;;;;;;;;;;;

;; consumes string or sexp of bs1 code and produces string of pyret code or #f
;;  if the bs1str cannot convert to a single line of pyret code
(define (format-oneline-bs1-as-pyret bs1str-or-sexp #:string-is-sexp? (string-is-sexp? #t))
  (with-handlers ([exn:fail:read? (lambda (exn) #f)]
                  [(lambda (exn) #t)
                   (lambda (exn) 
                     (printf "EXN msg: ~s~n" (exn-message exn))
                     #f)])
    (log-generated-pyret
     (cond [(equal? "\n" bs1str-or-sexp) bs1str-or-sexp] ; don't process newlines 
           [(racket-comment? bs1str-or-sexp) (format-comment-line bs1str-or-sexp)]
           [else (format-bs1-as-pyret 
                  (if (string? bs1str-or-sexp) 
                      (if string-is-sexp?
                          (with-input-from-string bs1str-or-sexp read) 
                          bs1str-or-sexp)
                      bs1str-or-sexp)
                  #:multi-line? #f)]))))

;; takes list of strings that make up one racket expression (optionally with leading comments/examples)
;;   and produces pyret rendering as a string
;; assumes comment and example lines, if any, are at the top of the code segment
;; - input from scribble comes in with newlines -- we filter those out at the start of the loop
;;   and reinsert them post conversion
;; MUST FIX to support examples that extend over multiple lines
(define (format-manyline-bs1-as-pyret bs1strs)
  (with-handlers ([exn:fail:read? (lambda (exn) #f)]
                  [(lambda (exn) #t)
                   (lambda (exn) 
                     (printf "EXN msg: ~s~n" (exn-message exn))
                     #f)])
    (log-generated-pyret
     (let loop ([all-lines (filter (lambda (s) (not (string=? s "\n"))) bs1strs)] [comment-lines '()] [example-lines '()])
       (if (empty? all-lines) 
           (assemble-multiline-code (reverse comment-lines) (reverse example-lines) all-lines)
           (cond [(racket-comment? (first all-lines))
                  (loop (rest all-lines) (cons (format-comment-line (first all-lines)) comment-lines) example-lines)]
                 [(racket-example? (first all-lines))
                  (let-values ([(examplestr used-lines) (read-example all-lines)])
                    (loop (list-tail all-lines used-lines)
                          comment-lines 
                          (cons examplestr example-lines)))]
                 [else ;; should only be body lines left
                  (let* ([pylines (map format-oneline-bs1-as-pyret all-lines)]
                         [body-lines
                          (if (member #f pylines)
                              ; next line assumes there is one sexp in all-lines, not multiple
                              (let ([sexp (with-input-from-string (apply string-append all-lines) read)])
                                (list (format-bs1-as-pyret sexp #:multi-line? #t)))
                              (list (string-join pylines "\n")))])
                    (assemble-multiline-code (reverse comment-lines) (reverse example-lines) body-lines))]))))))
                                
;; inserts pyret structure around checks in a multi-line code sample
(define (assemble-multiline-code comments examples bodies)
  (let ([all-lines (append comments
                           (if (empty? examples) empty
                               (append (list "checks:")
                                       ;; indent the examples
                                       (map (lambda (e) (string-append " " e)) examples)
                                       (list "end")))
                           bodies)])
    (string-join all-lines "\n")
    ))

