;; extends


; spell check strings
(string) @spell
; spell check the stringy parts of template strings
(string_fragment) @spell
; don't spell check import statement identifiers
(import_statement (string)) @nospell
; spell check variable declarations
(variable_declarator name: (identifier) @spell)
