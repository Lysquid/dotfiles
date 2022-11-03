vim.api.nvim_create_user_command(
  'ReloadConfig',
  'source $MYVIMRC | PackerCompile',
  {}
)

vim.api.nvim_create_autocmd({'FileType'}, {
  pattern = {'help'},
  command = 'wincmd L',
})
