-- guarding against init reload?
if vim.g.initLoaded then
  return
end

vim.g.initLoaded = true
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

require 'options'
require 'keymaps'
require 'lazy-bootstrap'
require 'lazy-plugins'

vim.api.nvim_sel_hl(0, 'Float', { bg = 'none' })
vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
-- vim.api.nvim_set_hl(0, 'Visual', { bg = 'none' })

vim.api.nvim_create_user_command('Init', 'e ~/.config/nvim/init.lua', {
  bang = true,
  desc = 'Open init.lua',
})
vim.api.nvim_create_user_command('Config', 'e ~/.config/nvim/', {
  bang = true,
  desc = 'Open Neovim config dir',
})
vim.api.nvim_create_user_command('Custom', 'e ~/.config/nvim/lua/custom/', {
  bang = true,
  desc = 'Open lua/custom/',
})
vim.api.nvim_create_user_command('Ftplugin', 'e ~/.config/nvim/after/ftplugin/', {
  bang = true,
  desc = 'Open after/ftplugin/',
})
vim.api.nvim_create_user_command('Options', 'e ~/.config/nvim/lua/options.lua', {
  bang = true,
  desc = 'Open lua/options.lua',
})
vim.api.nvim_create_user_command('Keymaps', 'e ~/.config/nvim/lua/keymaps.lua', {
  bang = true,
  desc = 'Open lua/keymaps.lua',
})
vim.api.nvim_create_user_command('Plugins', 'e ~/.config/nvim/lua/lazy-plugins.lua', {
  bang = true,
  desc = 'Open lua/lazy-plugins.lua',
})
vim.api.nvim_create_user_command('Alias', 'e ~/.bash_aliases', {
  bang = true,
  desc = 'Edit bash aliases',
})

local restore_cursor_augroup = vim.api.nvim_create_augroup('RestoreCursorShapeOnExit', {
  clear = true,
})

vim.api.nvim_create_autocmd('VimLeave', {
  group = restore_cursor_augroup,
  command = 'set guicursor=a:ver100',
})

vim.filetype.add {
  pattern = {
    ['/etc/nginx/.*'] = 'nginx',
    ['.*nginx.*%.conf'] = 'nginx',
  },
}
