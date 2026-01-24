-------------------------------------------------------------------------------
-- define commands to make nvim more fluid
-------------------------------------------------------------------------------
local e_cfg = 'e ~/.config/nvim/'
local e_lua = e_cfg .. '/lua'
local new_user_cmd = vim.api.nvim_create_user_command
local new_auto_cmd = vim.api.nvim_create_autocmd
local new_augroup = vim.api.nvim_create_augroup

local restore = new_augroup('RestoreCursorShapeOnExit', {
  clear = true,
})
new_auto_cmd('VimLeave', {
  group = restore,
  command = 'set guicursor=a:ver100',
})

-------------------------------------------------------------------------------
-- 'Builtin' commands with more default-type needs
-------------------------------------------------------------------------------
new_user_cmd('Init', e_cfg .. 'init.lua', {
  bang = true,
  desc = 'Open init.lua',
})
new_user_cmd('Config', e_cfg, {
  bang = true,
  desc = 'Open nvim/ config dir',
})
new_user_cmd('Custom', e_cfg .. 'lua/custom/', {
  bang = true,
  desc = 'Open lua/custom/',
})
new_user_cmd('After', e_cfg .. 'after/', {
  bang = true,
  desc = 'Open after/ config dir',
})
new_user_cmd('Ftplugin', e_cfg .. 'after/ftplugin/', {
  bang = true,
  desc = 'Open ftplugin/ config dir',
})
new_user_cmd('LuaDir', e_lua, {
  bang = true,
  desc = 'Open lua/ config dir',
})
new_user_cmd('Options', e_lua .. 'options.lua', {
  bang = true,
  desc = 'Open lua/options.lua',
})
new_user_cmd('Keymaps', e_lua .. 'keymaps.lua', {
  bang = true,
  desc = 'Open lua/keymaps.lua',
})
new_user_cmd('Commands', e_lua .. 'commands.lua', {
  bang = true,
  desc = 'Open lua/commands.lua',
})
new_user_cmd('Plugins', e_lua .. 'lazy-plugins.lua', {
  bang = true,
  desc = 'Open lua/lazy-plugins.lua',
})

-------------------------------------------------------------------------------
-- more unique/custom commands
-------------------------------------------------------------------------------
new_user_cmd('Aliases', 'e ~/.bash_aliases', {
  bang = true,
  desc = 'Edit bash aliases',
})
