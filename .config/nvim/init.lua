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

vim.filetype.add {
  pattern = {
    ['/etc/nginx/.*'] = 'nginx',
    ['.*nginx.*%.conf'] = 'nginx',
  },
}

vim.g.init_load_complete = true
