--------------------------------------------------------------------------------
-- Custom keymapping file
--------------------------------------------------------------------------------
local keymap = vim.keymap.set
local vdsll = vim.diagnostic.setloclist

keymap('n', '<Esc>', '<cmd>nohlsearch<CR>')
keymap('n', '<leader>q', vdsll, { desc = 'Open diag [Q]uickfix list' })
keymap('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

keymap('n', '<left>', '<cmd>echo "h"<CR>')
keymap('n', '<right>', '<cmd>echo "l"<CR>')
keymap('n', '<up>', '<cmd>echo "k"<CR>')
keymap('n', '<down>', '<cmd>echo "j"<CR>')

keymap('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
keymap('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
keymap('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
keymap('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

keymap('n', '<C-S-h>', '<C-w>H', { desc = 'Move window to the left' })
keymap('n', '<C-S-l>', '<C-w>L', { desc = 'Move window to the right' })
keymap('n', '<C-S-j>', '<C-w>J', { desc = 'Move window to the lower' })
keymap('n', '<C-S-k>', '<C-w>K', { desc = 'Move window to the upper' })

keymap('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', {
    clear = true,
  }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
