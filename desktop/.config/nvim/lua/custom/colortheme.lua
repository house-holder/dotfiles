-- Tokyo Night Storm
return {
  {
    'rebelot/kanagawa.nvim',
    priority = 1098,
  },
  -- {
  --   'shaunsingh/nord.nvim',
  --   lazy = false,
  --   priority = 1099,
  --   config = function()
  --     vim.g.nord_italic = false
  --     vim.cmd 'colorscheme nord'
  --   end,
  -- },
  {
    'folke/tokyonight.nvim',
    priority = 1100,
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('tokyonight').setup {
        styles = {
          comments = { italic = false },
          keywords = { italic = false },
        },
      }
      vim.cmd.colorscheme 'tokyonight-night'
    end,
  },
}
