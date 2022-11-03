local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)

    -- Plugin manager
    use { 'wbthomason/packer.nvim' }

    -- Theming
    use { 'joshdick/onedark.vim' }
    use { 'folke/tokyonight.nvim' }
    use { 'ellisonleao/gruvbox.nvim' }
    use 'marko-cerovac/material.nvim'
    use { 'kyazdani42/nvim-web-devicons' }
    use {
        'nvim-lualine/lualine.nvim',
        config = function() pcall(require, 'plugins.lualine') end,
    }
    use {
        'akinsho/bufferline.nvim',
        config = function() pcall(require, 'plugins.bufferline') end,
        opt = true
    }
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function() pcall(require, 'plugins.indent-blankline') end,
    }

    -- Fuzzy finder
    use {
        'nvim-telescope/telescope.nvim',
        config = function() pcall(require, 'plugins.telescope') end,
    }

    -- Git
    use {
        'lewis6991/gitsigns.nvim',
        config = function() pcall(require, 'plugins.gitsigns') end,
    }
    use { 'tpope/vim-fugitive' }

    -- Code manipulation
    use {
        'nvim-treesitter/nvim-treesitter',
        config = function() pcall(require, 'plugins.treesitter') end,
    }
    use { 'nvim-treesitter/nvim-treesitter-textobjects' }
    use {
        'numToStr/Comment.nvim',
        config = function() pcall(require, 'plugins.comment') end,
    }
    use { 'tpope/vim-surround' }
    use { 'wellle/targets.vim' }
    use { 'tpope/vim-repeat' }

    -- Utilities
    use { 'moll/vim-bbye' }
    use { 'nvim-lua/plenary.nvim' }
    use { 'editorconfig/editorconfig-vim' }
    use {
        'akinsho/toggleterm.nvim',
        config = function() pcall(require, 'plugins.toggleterm') end,
    }
    use { 'ggandor/leap.nvim' }
    require('leap').add_default_mappings()

    -- LSP support
    use {
        'neovim/nvim-lspconfig',
        config = function() pcall(require, 'plugins.lsp') end,
    }

    -- Autocomplete
    use {
        'hrsh7th/nvim-cmp',
        config = function() pcall(require, 'plugins.nvim-cmp') end,
    }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-path' }
    use { 'saadparwaiz1/cmp_luasnip' }
    use { 'hrsh7th/cmp-nvim-lsp' }

    -- Debug
    use {
        'mfussenegger/nvim-dap',
        config = function() pcall(require, 'plugins.nvim-dap') end,
    }

    -- Snippets
    use {
        'L3MON4D3/LuaSnip',
        config = function() pcall(require, 'plugins.luasnip') end,
    }
    use { 'rafamadriz/friendly-snippets' }

    -- File explorer
    use {
        'ptzz/lf.vim',
        requires = { 'voldikss/vim-floaterm' },
        opt = false,
    }
    use {
        'kyazdani42/nvim-tree.lua',
        config = function() pcall(require, 'plugins.nvim-tree') end,
        opt = true,
    }

    if packer_bootstrap then
        require('packer').sync()
    end
end)
