; Mach Tree-sitter Highlight Queries 
; Mapped to match mach.vim behavior for maroloccio theme

; ─── Comments (machComment -> Comment) ────────────────────────
(comment) @comment.line

; ─── Declaration keywords (machKeyword -> Keyword) ───────────
"use" @keyword
"fwd" @keyword
"pub" @keyword
"ext" @keyword
"def" @keyword
"rec" @keyword
"uni" @keyword
"val" @keyword
"var" @keyword
"fun" @keyword
"test" @keyword

; ─── Control flow keywords ───────────────────────────────────
"if" @keyword
"or" @keyword
"for" @keyword
"ret" @keyword
"brk" @keyword
"cnt" @keyword
"fin" @keyword

; ─── Assembly (machAsm -> Changed, Macro, SpecialComment) ────
"asm" @keyword

; ─── Literals ────────────────────────────────────────────────
(integer_literal) @number
(float_literal) @constant.numeric.float
(char_literal) @character
(string_literal) @string
(nil_literal) @constant.builtin

; ─── PreProc / Decorators (machPreProc -> PreProc) ───────────
(decorator) @function.macro

; ─── Types (machType -> Type) ────────────────────────────────
(primitive_type) @type.builtin
(type_identifier) @type
(record_declaration name: (identifier) @type.definition)
(union_declaration name: (identifier) @type.definition)
(type_alias_declaration name: (identifier) @type.definition)
(type_parameters (identifier) @type.parameter)
(type_arguments (_) @type)
(generic_type name: (identifier) @type)
(generic_type name: (type_identifier) @type)

; ─── Functions (machFunc -> Function) ────────────────────────
(function_declaration name: (identifier) @function.definition)
(parameter name: (identifier) @variable.parameter)
(pack_parameter name: (identifier) @variable.parameter)
(call_expression function: (identifier) @function.call)
(call_expression function: (field_expression field: (identifier) @function.method.call))

; ─── Pack spread / Projection (machSymbol -> Changed) ────────
(pack_spread_expression "..." @punctuation.special)
(projection_expression "." @punctuation.delimiter "[" @punctuation.bracket "]" @punctuation.bracket)

; ─── Fields and variables ───────────────────────────────────
(field_declaration name: (identifier) @property)
(field_expression field: (identifier) @property)
(initializer_field name: (identifier) @property)
(value_declaration name: (identifier) @variable)
(variable_declaration name: (identifier) @variable)

; ─── Modules (machInclude -> Include, machRepeat -> Repeat) ─
; use 和 fwd 后面所有标识符都是深绿色
(use_declaration alias: (identifier) @function.macro
  (module_path (identifier) @function.macro))
(forward_declaration alias: (identifier) @function.macro
  (module_path (identifier) @function.macro))

; ─── Test declarations ───────────────────────────────────────
(test_declaration name: (string_literal) @string.special)

; ─── Operators (machOperator -> Operator, machException -> Exception) ─
(binary_expression operator: _ @operator)
(unary_expression operator: _ @operator)
(cast_expression operator: _ @operator)
(assignment_expression "=" @operator)

; ─── Punctuation (machConstant -> Constant, machSymbol -> Changed) ───
"(" @punctuation.bracket
")" @punctuation.bracket
"{" @punctuation.bracket
"}" @punctuation.bracket
"[" @punctuation.bracket
"]" @punctuation.bracket
";" @punctuation.delimiter
":" @punctuation.delimiter
"," @punctuation.delimiter
"." @punctuation.delimiter
"*" @operator
"&" @operator

