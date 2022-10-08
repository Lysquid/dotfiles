-- Disabled
-- vim.opt.completeopt='menuone,noinsert,noselect'
-- vim.opt.clipboard = "unnamedplus"
--
-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Wrap
vim.opt.wrap = false

-- Mouse
vim.opt.mouse = 'a'

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false

-- Shortcuts
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>')
vim.keymap.set('n', '<leader>t', '<cmd>tabnew<cr>')
vim.keymap.set('n', '<leader>l', '<cmd>tabnext<cr>')
vim.keymap.set('n', '<leader>h', '<cmd>tabprevious<cr>')
vim.keymap.set('n', '<leader>L', '<cmd>tablast<cr>')
vim.keymap.set('n', '<leader>H', '<cmd>tabfirst<cr>')

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
end)


require('lualine').setup {
    options = { 
        theme = "material",
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
    }
}

