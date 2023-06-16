#lang br/quicklang
(provide + *)

(define-macro (stackerizer-mb EXPR)
  #'(#%module-begin
     (for-each displayln (reverse (flatten EXPR)))))

(provide (rename-out [stackerizer-mb #%module-begin]))

;;(define-macro-cases +
  ;;[(+ FIRST) #'FIRST]
  ;;[(+ FIRST NEXT ...) #'(list '+ FIRST (+ NEXT ...))])

(define-macro (define-ops OP ...)
  #'(begin
      (define-macro-cases OP
        [(OP FIRST) #'FIRST]
        [(OP FIRST NEXT (... ...))
         #'(list 'OP FIRST (OP NEXT (... ...)))])
      ...))

(define-ops + *)