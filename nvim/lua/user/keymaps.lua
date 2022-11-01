-- Space as leader key
vim.g.mapleader = ' '

-- Very used commands
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>')

-- Copy and paste
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>p', '"+p')

-- Tabs
vim.keymap.set('n', '<leader>t', '<cmd>tabnew<cr>')
vim.keymap.set('n', '<leader>l', '<cmd>tabnext<cr>')
vim.keymap.set('n', '<leader>h', '<cmd>tabprevious<cr>')
vim.keymap.set('n', '<leader>L', '<cmd>tablast<cr>')
vim.keymap.set('n', '<leader>H', '<cmd>tabfirst<cr>')
