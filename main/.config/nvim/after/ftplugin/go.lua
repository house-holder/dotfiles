print 'Loaded ft=Go'

-- Neovim options -------------------------------------------------------------
vim.opt_local.expandtab = false

-- Highlighting ---------------------------------------------------------------
vim.api.nvim_set_hl(0, 'FmtSpecifier', { fg = '#0db9d7' })
vim.api.nvim_set_hl(0, 'GoStructTag', { bold = true })

vim.fn.matchadd('FmtSpecifier', '\\v\\%[-+#0 ]*\\d*\\.?\\d*[vTtbcdoOqxXUeEfFgGwsp%]')
vim.fn.matchadd('GoStructTag', '\\v^\\s*[^/].*`\\zs\\w+:', 1)
