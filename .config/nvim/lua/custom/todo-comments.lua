return {
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      signs = true,
      keywords = {
        DEBUG = { icon = ' ', color = 'warning', alt = { 'DEBUG', '!!!' } },
      },
      merge_keywords = true,
    },
  },
}

