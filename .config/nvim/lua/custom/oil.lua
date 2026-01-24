return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    default_file_explorer = true,
    columns = {
      'icon',
    },
  },
  dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  watch_for_changes = true,
  prompt_save_on_select_new_entry = false,
  keymaps = {
    ['g?'] = { 'actions.show_help', mode = 'n' },
    ['<CR>'] = 'actions.select',
    ['<C-s>'] = { 'actions.select', opts = { vertical = true } },
    ['<C-h>'] = { 'actions.select', opts = { horizontal = true } },
    ['<C-t>'] = { 'actions.select', opts = { tab = true } },
    ['<C-p>'] = 'actions.preview',
    ['<C-c>'] = { 'actions.close', mode = 'n' },
    ['<C-l>'] = 'actions.refresh',
    ['-'] = { 'actions.parent', mode = 'n' },
    ['_'] = { 'actions.open_cwd', mode = 'n' },
    ['`'] = { 'actions.cd', mode = 'n' },
    ['g~'] = { 'actions.cd', opts = { scope = 'tab' }, mode = 'n' },
    ['gs'] = { 'actions.change_sort', mode = 'n' },
    ['gx'] = 'actions.open_external',
    ['g.'] = { 'actions.toggle_hidden', mode = 'n' },
    ['g\\'] = { 'actions.toggle_trash', mode = 'n' },
  },
  view_options = {
    show_hidden = true,
    natural_order = 'fast',
    case_insensitive = false,
    sort = {
      { 'type', 'asc' },
      { 'name', 'asc' },
    },
    highlight_filename = function(entry, is_hidden, is_link_target, is_link_orphan)
      return nil
    end,
  },
  git = {
    add = function(path)
      return false
    end,
    mv = function(src_path, dest_path)
      return false
    end,
    rm = function(path)
      return false
    end,
  },
  float = {
    padding = 2,
    max_width = 0.5,
    max_height = 0.5,
    border = nil,
    win_options = {
      winblend = 0,
    },
    get_win_title = nil,
    preview_split = 'auto',
    override = function(conf)
      return conf
    end,
  },
  preview_win = {
    update_on_cursor_moved = true,
    preview_method = 'load',
    disable_preview = function(filename)
      return false
    end,
    win_options = {},
  },
  confirmation = {
    max_width = 0.9,
  },
  lazy = false, -- recommended to leave lazy disabled
}
