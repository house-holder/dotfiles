return {
  {
    'folke/tokyonight.nvim',
    priority = 1099,
    config = function()
      require('tokyonight').setup {
        styles = {
          keywords = {
            -- italic = false,
            -- bold = true,
          },
          functions = {
            bold = true,
          },
          variables = {},
          floats = 'normal',
          sidebars = 'dark',
        },
      }
      vim.cmd.colorscheme 'tokyonight-night'
    end,
  },
  -- {
  --   'rebelot/kanagawa.nvim',
  --   lazy = false,
  --   priority = 1001,
  --   config = function()
  --     vim.cmd.colorscheme 'kanagawa'
  --   end,
  -- },
  -- {
  --   'tahayvr/matteblack.nvim',
  --   lazy = false,
  --   priority = 1003,
  --   config = function()
  --     vim.cmd.colorscheme 'matteblack'
  --   end,
  -- },
  -- {
  --   'shaunsingh/nord.nvim',
  --   lazy = false,
  --   priority = 1099,
  --   config = function()
  --     vim.g.nord_italic = false
  --     vim.cmd 'colorscheme nord'
  --   end,
  -- },
}
