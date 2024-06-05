" ~/.config/nvim/syntax/va.vim

" Define syntax highlighting rules
syntax keyword vaKeyword fn return throw break continue

" Highlight function names
syntax match vaFunction /\vfn\s+\w+/ contained

" Highlight function calls with alternatives
syntax match vaFunctionCall /\v\w+\(\)\s*\?\s*\{[^}]*\}/ contained

" Highlight function calls with error handling
syntax match vaFunctionCall /\v\w+\(\)\s*!\s*\{[^}]*\}/ contained

" Highlight types (int, void)
syntax keyword vaType int void

" Highlight constants (too_big)
syntax keyword vaConstant too_big

" Highlight numbers (100, 20, etc.)
syntax match vaNumber /\v\d+/ contained

" Highlight comments
syntax match vaComment /\/\/.*$/ contained

" Highlight strings (in double quotes)
syntax match vaString /".*"/ contained

" Link highlight groups
hi link vaKeyword Keyword
hi link vaFunction Function
hi link vaFunctionCall FunctionCall
hi link vaType Type
hi link vaConstant Constant
hi link vaNumber Number
hi link vaComment Comment
hi link vaString String
