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

vim.api.nvim_create_autocmd('FileType', {
  callback = function(event)
    local lang = vim.treesitter.language.get_lang(event.match)
    if not lang or lang == event.match then
      return
    end
    local ok = pcall(vim.treesitter.start)
    if not ok then
      pcall(vim.cmd, 'TSInstall ' .. lang)
    end
  end,
})

vim.g.init_load_complete = true
