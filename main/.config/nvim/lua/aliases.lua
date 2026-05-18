-- define common func aliases to clean up other files
return {
  userCmd = vim.api.nvim_create_user_command,
  autoCmd = vim.api.nvim_create_autocmd,
  auGrp = vim.api.nvim_create_augroup,
  findfile = vim.fn.findfile,
}
