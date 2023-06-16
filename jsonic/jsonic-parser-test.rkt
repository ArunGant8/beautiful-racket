#lang br
(require jsonic/parser jsonic/tokenizer brag/support)

(parse-to-datum (apply-tokenizer-maker make-tokenizer #<<ADITYA
"hi"
// comment
@$ 42 $@
ADITYA
))
