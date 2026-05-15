-------------------------------------------------------------------------------
-- commands.lua defines useful items for the cmdline -> :Commands
-------------------------------------------------------------------------------
local a = require 'aliases'

local e_cfg = 'e ~/.config/nvim/'
local e_lua = e_cfg .. 'lua/'

local restore = a.auGrp('RestoreCursorShapeOnExit', {
  clear = true,
})

a.autoCmd('VimLeave', {
  group = restore,
  command = 'set guicursor=a:ver100',
})

-- if using transparency, reload/reapply it during colorscheme change
a.autoCmd('ColorScheme', {
  callback = function()
    local tgt = 'transparency.lua'

    if a.findfile(tgt, vim.fn.stdpath 'config' .. '/lua') then
      package.loaded['transparency'] = nil
      require 'transparency'
    end
  end,
})

-------------------------------------------------------------------------------
-- 'Builtin' commands with more default-type needs
-------------------------------------------------------------------------------
a.userCmd('Init', e_cfg .. 'init.lua', {
  bang = true,
  desc = 'Open init.lua',
})
a.userCmd('Config', e_cfg, {
  bang = true,
  desc = 'Open nvim/ config dir',
})
a.userCmd('Custom', e_cfg .. 'lua/custom/', {
  bang = true,
  desc = 'Open lua/custom/',
})
a.userCmd('After', e_cfg .. 'after/', {
  bang = true,
  desc = 'Open after/ config dir',
})
a.userCmd('Ftplugin', e_cfg .. 'after/ftplugin/', {
  bang = true,
  desc = 'Open ftplugin/ config dir',
})
a.userCmd('LuaDir', e_lua, {
  bang = true,
  desc = 'Open lua/ config dir',
})
a.userCmd('Options', e_lua .. 'options.lua', {
  bang = true,
  desc = 'Open lua/options.lua',
})
a.userCmd('Keymaps', e_lua .. 'keymaps.lua', {
  bang = true,
  desc = 'Open lua/keymaps.lua',
})
a.userCmd('Commands', e_lua .. 'commands.lua', {
  bang = true,
  desc = 'Open lua/commands.lua',
})
a.userCmd('Plugins', e_lua .. 'lazy-plugins.lua', {
  bang = true,
  desc = 'Open lua/lazy-plugins.lua',
})

-------------------------------------------------------------------------------
-- more unique/custom commands
-------------------------------------------------------------------------------
a.userCmd('Aliases', 'e ~/.bash_aliases', {
  bang = true,
  desc = 'Edit bash aliases',
})
