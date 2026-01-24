--------------------------------------------------------------------------------
-- Custom plugin specifier file. For a modular config (which this is),
--			prefer adding plugins as their own files under the `custom/` dir
--------------------------------------------------------------------------------
require('lazy').setup({
  'ThePrimeagen/vim-be-good', -- vim motion games
  { import = 'custom' },
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
