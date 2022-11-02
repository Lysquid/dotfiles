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
