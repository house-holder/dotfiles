return {
  'luukvbaal/statuscol.nvim',
  config = function()
    require('statuscol').setup {
      text = { '%C' },
      click = 'v:lua.ScFa',
      hl = 'FoldColumn',
      condition = { true },
      fold = {
        width = 2,
        close = '', -- foldclose
        open = '', -- foldopen
        sep = ' ', -- foldsep
      },
    }
  end,
}
