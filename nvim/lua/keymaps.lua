-- Space as leader key
vim.g.mapleader = ' '

-- Shorthands
vim.keymap.set('n', '<C-q>', '<cmd>quit<cr>')
vim.keymap.set('n', '<C-s>', '<cmd>write<cr>')

-- Azerty fix
vim.keymap.set('n', '((', '(')
vim.keymap.set('n', '))', ')')

-- Copy and paste
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>p', '"+p')

-- Terminal
vim.keymap.set('t', '<C-q>', '<C-\\><C-n>')

-- Windows
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
