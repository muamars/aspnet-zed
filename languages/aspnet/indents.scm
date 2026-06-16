; Auto-indentation rules for ASP.NET Razor files

; C# code blocks
(code_block
  "}" @end) @indent

; HTML elements
(html_element
  (html_end_tag) @end) @indent

; Self-closing HTML elements (no indent body)
(html_self_closing_element) @indent

; Razor directive code blocks
(directive_code
  "}" @end) @indent

(directive_functions
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

(razor_do
  "}" @end) @indent

(razor_switch
  "}" @end) @indent

(razor_try
  "}" @end) @indent

(razor_using
  "}" @end) @indent

(razor_lock
  "}" @end) @indent

; Razor section
(razor_section
  "}" @end) @indent
