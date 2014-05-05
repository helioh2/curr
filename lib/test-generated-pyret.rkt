#lang racket/base

;; infrastructure for testing that generated code is valid pyret

(require "paths.rkt")

(provide log-generated-pyret
         reset-pyret-log
         )

(define PYRET-LOG (build-path testing-dir "pyret-exprs.arr"))

(define (reset-pyret-log)
  (when (file-exists? PYRET-LOG)
    (delete-file PYRET-LOG)))

;; if a string is just a single identifier/atom
(define (atomic-str? str)
  (not (ormap char-whitespace? (string->list str))))
  
(define (pyret-comment? str)
  (string=? "#" (substring str 0 1)))

;; log pyret strings that are more than atoms
(define (log-generated-pyret pystr)
  (unless (or (atomic-str? pystr)
              (pyret-comment? pystr))
    (with-output-to-file PYRET-LOG
      #:exists 'append
      (lambda ()
        (display pystr)
        (printf "~n~n"))))
  pystr)