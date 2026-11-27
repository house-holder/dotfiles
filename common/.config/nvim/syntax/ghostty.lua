if vim.b.current_syntax then
  return
end

vim.cmd [[
  syntax match ghosttyComment /^\s*#.*$/
  syntax match ghosttyKey     /^\s*[a-z0-9-]\+\ze\s*=/
  syntax match ghosttyEquals  /=/
  syntax match ghosttyNumber  /\<\d\+\(\.\d\+\)\?\>/
  syntax match ghosttyColor   /#\x\{6}\>/
	syntax match  ghosttyValue  /=\s*\zs.*$/ contains=ghosttyString,ghosttyColor,ghosttyNumber,ghosttyBool
	syntax region ghosttyString start=/"/ skip=/\\"/ end=/"/ oneline contained
	syntax match  ghosttyColor  /#\(\x\{8}\|\x\{6}\|\x\{3}\)\>/
  syntax keyword ghosttyBool  true false

  hi def link ghosttyComment Comment
  hi def link ghosttyKey     Identifier
  hi def link ghosttyEquals  Operator
	hi def link ghosttyValue   String
	hi def link ghosttyString  String
  hi def link ghosttyNumber  Number
  hi def link ghosttyColor   Constant
  hi def link ghosttyBool    Boolean
]]

vim.b.current_syntax = 'ghostty'
