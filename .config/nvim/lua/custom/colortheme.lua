-- Tokyo Night Storm
return {
  { -- You can easily change to a different colorscheme.
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
      vim.cmd.colorscheme 'tokyonight-storm'
    end,
  },
}

-- NORD
-- return {
--   {
--     'shaunsingh/nord.nvim',
--     lazy = false,
--     priority = 1100,
--     config = function()
--       vim.g.nord_italic = false
--       vim.cmd 'colorscheme nord'
--     end,
--   },
-- }
