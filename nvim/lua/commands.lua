-- ReloadConfig command, kept as an example
-- vim.api.nvim_create_user_command(
--   'ReloadConfig',
--   'source $MYVIMRC | PackerCompile',
--   {}
-- )

-- Open help files in vertical split by default
vim.api.nvim_create_autocmd({ 'FileType' }, {
    pattern = { 'help' },
    command = 'wincmd L',
})

vim.cmd('autocmd TermOpen * setlocal nonumber norelativenumber')
vim.cmd('autocmd TermOpen * setlocal signcolumn=no')
