--------------------------------------------------------------------------------
-- Custom option setting
--------------------------------------------------------------------------------
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus' -- :help 'clipboard'
end)

vim.opt.expandtab = false
vim.opt.smarttab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4 -- >> or << shifting
vim.opt.softtabstop = 4
vim.opt.breakindent = true -- line wrap to same indent level

vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a' -- enabled for all
vim.opt.showmode = false

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevel = 20
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
vim.opt.listchars = {
  tab = '  ',
  -- trail = '·',
  trail = '￮',
  -- tab = '·┈',
  -- multispace = '￮',
  -- lead = '  ',
  -- extends = '▶',
  -- precedes '◀',
  nbsp = '␣',
}
vim.opt.inccommand = 'nosplit'
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.confirm = false
