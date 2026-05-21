print 'Loaded ft=Python'
-- old style
vim.fn.matchadd('Special', '\\v\\%[-+#0 ]*\\d*\\.?\\d*[diouxXeEfFgGaAcrs%]')
-- new style
vim.fn.matchadd('Special', '\\v\\{[^}]*\\}')
