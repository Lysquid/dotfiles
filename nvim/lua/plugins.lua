-- Auto install if packer is not present
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

    -- Depedencies
    use { 'nvim-lua/plenary.nvim' }

    -- Theming
    use { 'joshdick/onedark.vim' }
    use { 'folke/tokyonight.nvim' }
    use { 'ellisonleao/gruvbox.nvim' }
    use { 'marko-cerovac/material.nvim' }
    use { 'kyazdani42/nvim-web-devicons' }
    use { 'nvim-lualine/lualine.nvim',
        config = function() require('plugins.lualine') end,
    }
    use { 'goolord/alpha-nvim',
        config = function() require('plugins.alpha') end,
    }

    -- Improvements
    use { 'lukas-reineke/indent-blankline.nvim',
        config = function() require('plugins.indent-blankline') end,
    }
    use { 'norcalli/nvim-colorizer.lua',
        config = function() require('colorizer').setup() end,
    }
    use { 'rktjmp/highlight-current-n.nvim',
        config = function() require('plugins.highlight-current-n') end,
    }
    use { 'tpope/vim-unimpaired' }
    use { 'sheerun/vim-polyglot' }
    use{ "gbprod/yanky.nvim",
        config = function() require('plugins.yanky') end,
    }
    use { 'moll/vim-bbye' }

    -- Fuzzy finder
    use { 'nvim-telescope/telescope.nvim',
        config = function() require('plugins.telescope') end,
    }
    use { 'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make'
    }

    -- Git
    use { 'lewis6991/gitsigns.nvim',
        config = function() require('plugins.gitsigns') end,
    }
    use { 'tpope/vim-fugitive' }

    -- Code manipulation
    use { 'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function() require('plugins.treesitter') end,
    }
    use { 'nvim-treesitter/nvim-treesitter-textobjects' }
    use { 'numToStr/Comment.nvim',
        config = function() require('Comment').setup() end,
    }
    use { 'tpope/vim-surround' }
    use { 'wellle/targets.vim' }
    use { 'tpope/vim-repeat' }
    use { 'smbl64/vim-black-macchiato' }

    -- LSP
    use { 'neovim/nvim-lspconfig',
        requires = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'folke/neodev.nvim',
        },
        config = function() require('plugins.lspconfig') end,
    }

    -- Autocomplete
    use { 'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-nvim-lsp-signature-help',
            'hrsh7th/cmp-nvim-lua',
            'saadparwaiz1/cmp_luasnip',
            'petertriho/cmp-git',
        },
        config = function() require('plugins.cmp') end,
    }

    -- Snippets
    use { 'L3MON4D3/LuaSnip',
        requires = { 'rafamadriz/friendly-snippets' },
        config = function() require('luasnip.loaders.from_vscode').lazy_load() end,
    }

    -- Debugger
    use { 'mfussenegger/nvim-dap',
        requires = {
            'theHamsta/nvim-dap-virtual-text',
            'mfussenegger/nvim-dap-python',
        },
        config = function() require('plugins.dap') end,
    }
    use { 'rcarriga/nvim-dap-ui',
        config = function() require('plugins.dap-ui') end,
    }

    -- File explorer
    use { 'ptzz/lf.vim',
        requires = { 'voldikss/vim-floaterm' },
        config = function() require('plugins.lf') end,
    }

    -- Sessions manager
    use { 'rmagatti/auto-session',
        config = function() require('plugins.auto-session') end,
    }

    -- Why not
    use { 'eandrju/cellular-automaton.nvim' }

    -- Sync on first launch
    if packer_bootstrap then
        require('packer').sync()
    end
end)

-- Automatically source and re-compile packer whenever you save this file
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
    command = 'source <afile> | silent! LspStop | silent! LspStart | PackerCompile',
    group = packer_group,
    pattern = vim.fn.expand 'lua/plugins.lua',
})
