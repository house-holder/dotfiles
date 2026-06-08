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

local exclude = {
  oil = true,
  fidget = true,
  toml = true,
}

vim.api.nvim_create_autocmd('FileType', {
  callback = function(event)
    if exclude[event.match] then
      return
    end
    local ok = pcall(vim.treesitter.start)
    if not ok then
      local lang = vim.treesitter.language.get_lang(event.match)
      if lang then
        local parser_exists = pcall(vim.treesitter.language.inspect, lang)
        if not parser_exists then
          vim.cmd('TSInstall ' .. lang)
          print('TSInstall: "' .. lang .. '", restart for highlighting.')
        end
      end
    end
  end,
})

vim.g.init_load_complete = true
