-- early guard against reinit
if vim.g.init_load_complete then
  return
end

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

-- NOTE: lazy items must come first
require 'lazy-bootstrap'
require 'lazy-plugins'

require 'options'
require 'keymaps'
require 'commands'
require 'transparency'

local ts_blocklist = {
  ['oil'] = true,
  ['neo-tree'] = true,
  ['gitcommit'] = true,
  ['neo-tree-popup'] = true,
}

vim.api.nvim_create_autocmd('FileType', {
  callback = function(event)
    if ts_blocklist[event.match] then
      return
    end
    local lang = vim.treesitter.language.get_lang(event.match)
    if not lang then
      return
    end
    local parser_ok = pcall(vim.treesitter.language.inspect, lang)
    if not parser_ok then
      pcall(function()
        vim.cmd('TSInstall ' .. lang)
      end)
      return
    end
    pcall(vim.treesitter.start)
  end,
})

vim.g.init_load_complete = true
