; Bracket matching for ASP.NET Razor files

("{" @open "}" @close)
("[" @open "]" @close)
("(" @open ")" @close)

; HTML angle brackets
("<" @open ">" @close)

; String quotes (exclude from rainbow brackets)
(("\"" @open "\"" @close) (#set! rainbow.exclude))
(("'" @open "'" @close) (#set! rainbow.exclude))

; Razor block comment delimiters
(razor_comment
  "@*" @open
  "*@" @close)

; HTML comment delimiters
(html_comment
  "<!--" @open
  "-->" @close)
