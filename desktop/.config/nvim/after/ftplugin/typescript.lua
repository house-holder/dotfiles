-- Neovim options -------------------------------------------------------------
vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2

-- Highlighting ---------------------------------------------------------------
vim.fn.matchadd('Special', '\\v\\$\\{[^}]*\\}')
-- vim.fn.matchadd('Special', '\\v`[^`]*\\zs\\$\\{')
-- vim.fn.matchadd('Special', '\\v`[^`]*\\$\\{[^}]*\\zs\\}')
