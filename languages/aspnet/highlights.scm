; inherits: c_sharp

; ==================== RAZOR COMMENTS ====================
; @* ... *@ block comments (like VS Code: dim green)
(razor_comment) @comment
(html_comment) @comment

; ==================== RAZOR DIRECTIVES ====================
; Page/layout/model directives (purple in VS Code)
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

; Using/import directive (keyword-like)
"at_using" @keyword.directive

; Block directives
[
  "at_block"
  "at_section"
] @keyword

; Tag helper directives
[
  "at_addtaghelper"
  "at_removetaghelper"
  "at_taghelperprefix"
] @preproc

; @ escape
"at_at_escape" @string.special

; Colon transition (@:)
"at_colon_transition" @keyword

; ==================== CONTROL FLOW ====================
; Conditional directives (purple in VS Code)
[
  "at_if"
  "at_switch"
] @keyword.conditional

; Loop directives
[
  "at_for"
  "at_foreach"
  "at_while"
  "at_do"
] @keyword.repeat

; Exception handling
[
  "at_try"
  "catch"
  "finally"
] @keyword.exception

; Lock directive
"at_lock" @keyword

; ==================== EXPRESSIONS ====================
; @variable and @(expression)
[
  "at_implicit"
  "at_explicit"
] @keyword.coroutine

; Razor implicit expression (the @identifier part)
(razor_implicit_expression
  "at_implicit" @keyword.coroutine)

; Await expressions inside razor
(await_expression
  "await" @keyword.coroutine)

; ==================== HTML TAGS ====================
; Standard HTML tags
(tag_name) @tag

; Razor-specific attributes
(razor_attribute_name) @attribute

; Tag helper wildcard
(taghelper_wildcard) @character.special

; ==================== RAZOR PROPERTIES ====================
; @bind, @ref, @onclick etc. in attributes
(razor_rendermode) @property

; ==================== C# EMBEDDED CONTENT ====================
; C# code blocks get embedded highlighting
(csharp_code) @embedded

; ==================== FALLBACK ====================
; Generic identifiers used in various contexts
(identifier) @variable
