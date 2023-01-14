-- ReloadConfig command, kept as an example
-- vim.api.nvim_create_user_command(
--   'ReloadConfig',
--   'source $MYVIMRC | PackerCompile',
--   {}
-- )

-- Setup Python (for black, but not only)
vim.api.nvim_command('let g:python3_host_prog = $HOME . "/.local/venv/nvim/bin/python"')

-- Open help files in vertical split by default
vim.api.nvim_create_autocmd({ 'FileType' }, {
    pattern = 'help',
    command = 'wincmd L',
})

-- Disable line numbers and sign column in terminal buffers
vim.api.nvim_create_autocmd({ 'TermOpen' }, {
    command = 'setlocal nonumber norelativenumber | setlocal signcolumn=no'
})

-- Enter insert mode when entering a terminal
vim.api.nvim_create_autocmd({ 'WinEnter' }, {
    pattern = 'term://*',
    command = 'startinsert',
})
