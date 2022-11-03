-- Space as leader key
vim.g.mapleader = ' '

-- Very often used commands
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>')

-- Copy and paste
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>p', '"+p')

-- Commands
vim.keymap.set('n', '<leader>q', '<cmd>bdelete<cr>')

-- File manager
vim.g.lf_map_keys = 0
vim.keymap.set('n', '<leader>k', '<cmd>Lf<cr>')

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-q>', '<cmd>bdelete<cr>')

