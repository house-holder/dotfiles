return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    main = 'nvim-treesitter.config',
    opts = {
      ensure_installed = {
        'bash',
        'c',
        'diff',
        'go',
        'html',
        'javascript',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'odin',
        'query',
        'typescript',
        'vim',
        'vimdoc',
      },
      auto_install = true,
      highlight = {
        enable = true,
        distable = {
          'toml',
        },
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = {
        enable = true,
        -- disable = {
        --   'ruby',
        --   'javascript',
        --   'c',
        --   'cpp',
        -- },
      },
    },
  },
}
