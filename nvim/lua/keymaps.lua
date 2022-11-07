-- Space as leader key
vim.g.mapleader = ' '

-- Disable some defaults
vim.keymap.set('', '<leader>', '<nop>')

-- Shorthands
vim.keymap.set('', '<C-s>', '<cmd>write<cr>')
vim.keymap.set('', '<C-q>', '<cmd>bdelete<cr>')
vim.keymap.set('t', '<C-q>', '<cmd>bdelete!<cr>')
vim.keymap.set('', '<leader>t', '<C-w>v<cmd>terminal<cr>')
vim.keymap.set('', '<leader>T', '<cmd>terminal<cr>')
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
vim.keymap.set('', '<C-n>', '<cmd>bnext<cr>')
vim.keymap.set('', '<C-p>', '<cmd>bprevious<cr>')

-- Azerty fix
vim.keymap.set('', '(', '[', { remap = true })
vim.keymap.set('', ')', ']', { remap = true })
vim.keymap.set('', '((', '(')
vim.keymap.set('', '))', ')')
vim.keymap.set('', 'é', '~', { remap = true })
vim.keymap.set('', 'è', '`', { remap = true })
vim.keymap.set('', 'à', '@', { remap = true })
vim.keymap.set('', 'ç', '^', { remap = true })
vim.keymap.set('', 'ù', '%', { remap = true })

-- Copy and paste
vim.keymap.set('', '<leader>y', '"+y')
vim.keymap.set('', '<leader>Y', '"+Y')
vim.keymap.set('', '<leader>p', '"+p')
vim.keymap.set('', '<leader>P', '"+P')

-- Windows
vim.keymap.set('', '<C-l>', '<C-w>l')
vim.keymap.set('', '<C-h>', '<C-w>h')
vim.keymap.set('', '<C-j>', '<C-w>j')
vim.keymap.set('', '<C-k>', '<C-w>k')
