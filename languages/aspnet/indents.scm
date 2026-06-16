; Auto-indentation rules for ASP.NET Razor files

; HTML elements
(element
  ">" @end) @indent

; @code / @functions blocks
(razor_block
  "}" @end) @indent

; Control structures
(razor_if
  "}" @end) @indent

(razor_foreach
  "}" @end) @indent

(razor_for
  "}" @end) @indent

(razor_while
  "}" @end) @indent

(razor_do_while
  "}" @end) @indent

(razor_switch
  "}" @end) @indent

(razor_try
  "}" @end) @indent

(razor_compound_using
  "}" @end) @indent

(razor_lock
  "}" @end) @indent

; @section
(razor_section
  "}" @end) @indent
