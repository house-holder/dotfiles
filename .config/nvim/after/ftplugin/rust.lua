print 'Loaded ft=Rust'

-- Neovim options -------------------------------------------------------------
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4

-- Highlighting ---------------------------------------------------------------
vim.api.nvim_set_hl(0, 'RustFormatVar', { fg = '#c0caf5' })
vim.fn.matchadd('RustFormatVar', '\\v\\{\\zs[a-zA-Z_][a-zA-Z0-9_]*\\ze[:}]')
