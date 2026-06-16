; inherits: c_sharp

; ==================== COMMENTS ====================
(razor_comment) @comment
(html_comment) @comment

; ==================== DIRECTIVES ====================
[
  "at_page"
  "at_model"
  "at_rendermode"
  "at_inject"
  "at_implements"
  "at_layout"
  "at_inherits"
  "at_attribute"
  "at_typeparam"
  "at_namespace"
  "at_preservewhitespace"
] @keyword.directive

"at_using" @keyword.directive

[
  "at_block"
  "at_section"
] @keyword

[
  "at_addtaghelper"
  "at_removetaghelper"
  "at_taghelperprefix"
] @preproc

"at_at_escape" @string.special
"at_colon_transition" @keyword

; ==================== CONTROL FLOW ====================
[
  "at_if"
  "at_switch"
] @keyword.conditional

[
  "at_for"
  "at_foreach"
  "at_while"
  "at_do"
] @keyword.repeat

[
  "at_try"
  "catch"
  "finally"
] @keyword.exception

"at_lock" @keyword

; ==================== EXPRESSIONS ====================
[
  "at_implicit"
  "at_explicit"
] @keyword.coroutine

(razor_implicit_expression
  "at_implicit" @keyword.coroutine)

(await_expression
  "await" @keyword.coroutine)

; ==================== RAZOR ATTRIBUTES ====================
(razor_attribute_name) @attribute
(razor_rendermode) @property
(taghelper_wildcard) @character.special

; ==================== RAZOR BLOCKS ====================
(razor_block
  "{" @punctuation.bracket
  "}" @punctuation.bracket)

(razor_if
  "{" @punctuation.bracket
  "}" @punctuation.bracket)

(razor_foreach
  "{" @punctuation.bracket
  "}" @punctuation.bracket)

(razor_for
  "{" @punctuation.bracket
  "}" @punctuation.bracket)

(razor_while
  "{" @punctuation.bracket
  "}" @punctuation.bracket)

(razor_do_while
  "{" @punctuation.bracket
  "}" @punctuation.bracket)

(razor_try
  "{" @punctuation.bracket
  "}" @punctuation.bracket)

(razor_switch
  "{" @punctuation.bracket
  "}" @punctuation.bracket)

(razor_section
  "{" @punctuation.bracket
  "}" @punctuation.bracket)

; ==================== HTML ELEMENTS ====================
(element
  "<" @punctuation.bracket)

(element
  ">" @punctuation.bracket)

(element
  "/>" @punctuation.bracket)

(element
  "</" @punctuation.bracket)
