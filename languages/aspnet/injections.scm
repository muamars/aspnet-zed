; ==================== C# INJECTION ====================
; Inject C# syntax highlighting into Razor code blocks

((csharp_code) @injection.content
  (#set! injection.language "csharp"))

; ==================== CSS INJECTION ====================
; Inject CSS into <style> tags
((html_element
  (html_start_tag
    (tag_name) @_tag_name)
  (#eq? @_tag_name "style"))
  @injection.content
  (#set! injection.language "css"))

; ==================== JAVASCRIPT INJECTION ====================
; Inject JavaScript into <script> tags
((html_element
  (html_start_tag
    (tag_name) @_tag_name)
  (#eq? @_tag_name "script"))
  @injection.content
  (#set! injection.language "javascript"))
