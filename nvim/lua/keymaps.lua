-- Space as leader key
vim.g.mapleader = ' '

-- Disable some defaults
vim.keymap.set('', '<Space>', '<Nop>', { silent = true })
vim.keymap.set('', 'J', '<Nop>', { silent = true })

-- Shorthands
vim.keymap.set('', '=b', 'gg=G<C-O>')    -- fix indentation of the whole buffer
vim.keymap.set('', '<leader>v', 'ggVG0') -- select whole document

-- Conventional shorcuts
vim.keymap.set({ '', 'i', 's' }, '<C-s>', '<Cmd>write<CR>')
vim.keymap.set('', '<C-c>', '"+y')
vim.keymap.set({ 'i', 's' }, '<C-v>', '<Esc>"+pa')
vim.keymap.set('v', '<C-v>', 'd"+P')
vim.keymap.set({ 'i', 's', 'c' }, '<C-BS>', '<C-w>')

-- Page up and down
vim.keymap.set('', '<PageUp>', '<C-d>')
vim.keymap.set('', '<PageDown>', '<C-u>')

-- Navigate with word wrap
vim.keymap.set('', 'j', 'gj', { silent = true })
vim.keymap.set('', 'k', 'gk', { silent = true })

-- Terminal
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>') -- Esc to leave terminal mode
vim.keymap.set('', '<leader>t', '<C-w>v<Cmd>terminal<CR>i')
vim.keymap.set('', '<leader>T', '<C-w>s<Cmd>terminal<CR>i')

-- Copy and paste
vim.keymap.set('', '<leader>y', '"+y')
vim.keymap.set('', '<leader>Y', '"+Y')
vim.keymap.set('', '<leader>p', '"+p')
vim.keymap.set('', '<leader>P', '"+P')

-- Window movement
vim.keymap.set({ '', 't', 'i', 's' }, '<A-Right>', '<Esc><C-w>l', { remap = true }) -- remap needed for the terminal
vim.keymap.set({ '', 't', 'i', 's' }, '<A-Left>', '<Esc><C-w>h', { remap = true })
vim.keymap.set({ '', 't', 'i', 's' }, '<A-Down>', '<Esc><C-w>j', { remap = true })
vim.keymap.set({ '', 't', 'i', 's' }, '<A-Up>', '<Esc><C-w>k', { remap = true })

-- Window resize
vim.keymap.set({ '', 't', 'i', 's' }, '<A-S-Right>', '<Cmd>vertical resize +10<CR>')
vim.keymap.set({ '', 't', 'i', 's' }, '<A-S-Left>', '<Cmd>vertical resize -10<CR>')
vim.keymap.set({ '', 't', 'i', 's' }, '<A-S-Down>', '<Cmd>resize -5<CR>')
vim.keymap.set({ '', 't', 'i', 's' }, '<A-S-Up>', '<Cmd>resize +5<CR>')

-- Window shorcuts
vim.keymap.set({ '', 't', 'i', 's' }, '<A-r>', '<Esc><C-w>r')
vim.keymap.set({ '', 't', 'i', 's' }, '<C-q>', '<Cmd>quit<CR>')
vim.keymap.set({ '', 'i', 's' }, '<C-x>', '<Cmd>Bdelete<CR>')
vim.keymap.set('t', '<C-x>', '<Cmd>bdelete!<CR>')

-- Tabs
vim.keymap.set('', '<C-PageUp>', 'gT')
vim.keymap.set('', '<C-PageDown>', 'gt')
