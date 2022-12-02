-- Space as leader key
vim.g.mapleader = ' '

-- Disable some defaults
vim.keymap.set('', '<leader>', '<nop>')

-- Shorthands
vim.keymap.set({ '', 'i', 's' }, '<C-s>', '<cmd>write<cr>')
vim.keymap.set({ '', 'i', 's' }, '<C-x>', '<cmd>bdelete<cr>')
vim.keymap.set('', '<S-CR>', 'o<Esc>') -- insert blank line below in normal mode
vim.keymap.set('', '=b', 'gg=G<C-O>') -- fix indentation of the whole buffer
vim.keymap.set('', '<C-a>', 'gg0vG$') -- select whole document

-- Terminal
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>') -- Esc to leave terminal mode
vim.keymap.set('t', '<C-x>', '<cmd>bdelete!<cr>')
vim.keymap.set('', '<leader>t', '<C-w>v<cmd>terminal<cr>i')
vim.keymap.set('', '<leader>T', '<C-w>s<cmd>terminal<cr>i')

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
vim.keymap.set('', '<C-q>', '<C-w>q')

-- Equivalent for other modes
vim.keymap.set({ 't', 'i', 's' }, '<C-l>', '<Esc><C-w>l', { remap = true })
vim.keymap.set({ 't', 'i', 's' }, '<C-h>', '<Esc><C-w>h', { remap = true })
vim.keymap.set({ 't', 'i', 's' }, '<C-j>', '<Esc><C-w>j', { remap = true })
vim.keymap.set({ 't', 'i', 's' }, '<C-k>', '<Esc><C-w>k', { remap = true })
vim.keymap.set({ 't', 'i', 's' }, '<C-q>', '<Esc><C-w>q', { remap = true })
