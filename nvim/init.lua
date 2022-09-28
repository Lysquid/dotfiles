-- General
vim.opt.mouse = 'a'
vim.opt.hlsearch = false

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = false

-- Tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Shortcuts
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>')
vim.keymap.set('n', '<leader>t', '<cmd>tabnew<cr>')
vim.keymap.set('n', '<leader>l', '<cmd>tabnext<cr>')
vim.keymap.set('n', '<leader>h', '<cmd>tabprevious<cr>')
vim.keymap.set('n', '<leader>L', '<cmd>tablast<cr>')
vim.keymap.set('n', '<leader>H', '<cmd>tabfirst<cr>')
