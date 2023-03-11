-- Space as leader key
vim.g.mapleader = ' '

-- Disable some defaults
vim.keymap.set('', '<Space>', '<Nop>', { silent = true })
vim.keymap.set('', 'J', '<Nop>', { silent = true })

-- Shorthands
vim.keymap.set({ '', 'i', 's' }, '<C-s>', '<Cmd>write<CR>')
vim.keymap.set({ '', 'i', 's' }, '<C-x>', '<Cmd>Bdelete<CR>')
vim.keymap.set('', '=b', 'gg=G<C-O>') -- fix indentation of the whole buffer
vim.keymap.set('', '<leader>v', 'ggVG0') -- select whole document
vim.keymap.set('', 'H', '^')
vim.keymap.set('', 'L', '$')
vim.keymap.set('v', '<C-c>', '"+y')

-- Navigate with word wrap
vim.keymap.set('', 'j', 'gj', { silent = true })
vim.keymap.set('', 'k', 'gk', { silent = true })

-- Terminal
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>') -- Esc to leave terminal mode
vim.keymap.set('t', '<C-x>', '<Cmd>bdelete!<CR>')
vim.keymap.set('', '<leader>t', '<C-w>v<Cmd>terminal<CR>i')
vim.keymap.set('', '<leader>T', '<C-w>s<Cmd>terminal<CR>i')

-- Azerty fix
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
vim.keymap.set('', '<M-l>', '<Cmd>vertical resize +10<CR>')
vim.keymap.set('', '<M-h>', '<Cmd>vertical resize -10<CR>')
vim.keymap.set('', '<M-j>', '<Cmd>resize -5<CR>')
vim.keymap.set('', '<M-k>', '<Cmd>resize +5<CR>')

-- Equivalent for other modes
vim.keymap.set({ 't', 'i', 's' }, '<C-l>', '<Esc><C-w>l', { remap = true })
vim.keymap.set({ 't', 'i', 's' }, '<C-h>', '<Esc><C-w>h', { remap = true })
vim.keymap.set({ 't', 'i', 's' }, '<C-j>', '<Esc><C-w>j', { remap = true })
vim.keymap.set({ 't', 'i', 's' }, '<C-k>', '<Esc><C-w>k', { remap = true })
vim.keymap.set({ 't', 'i', 's' }, '<C-q>', '<Esc><C-w>q', { remap = true })
