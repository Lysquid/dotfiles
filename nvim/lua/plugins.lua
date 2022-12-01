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
        config = function() require('plugins.colorizer') end,
    }
    use { 'rktjmp/highlight-current-n.nvim',
        config = function() require('plugins.highlight-current-n') end,
    }
    use { 'karb94/neoscroll.nvim',
        config = function() require('plugins.neoscroll') end,
    }

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
        config = function() require('plugins.treesitter') end,
    }
    use { 'nvim-treesitter/nvim-treesitter-textobjects' }
    use { 'numToStr/Comment.nvim',
        config = function() require('plugins.comment') end,
    }
    use { 'tpope/vim-surround' }
    use { 'wellle/targets.vim' }
    use { 'tpope/vim-repeat' }

    -- Utilities
    use { 'nvim-lua/plenary.nvim' }
    use { 'moll/vim-bbye' }
    use { 'ggandor/leap.nvim',
        config = function() require('plugins.leap') end,
    }

    -- LSP support
    use { 'neovim/nvim-lspconfig',
        config = function() require('plugins.lspconfig') end,
    }

    -- Autocomplete
    use { 'hrsh7th/nvim-cmp',
        config = function() require('plugins.cmp') end,
    }
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-cmdline' }
    use { 'hrsh7th/cmp-nvim-lsp-signature-help' }
    use { 'hrsh7th/cmp-nvim-lua' }
    use { 'saadparwaiz1/cmp_luasnip' }
    use { 'petertriho/cmp-git' }

    -- Snippets
    use { 'L3MON4D3/LuaSnip',
        config = function() require('plugins.luasnip') end,
    }
    use { 'rafamadriz/friendly-snippets' }

    -- Debug
    use { 'mfussenegger/nvim-dap',
        config = function() require('plugins.dap') end,
        opt = true,
    }
    use { 'sakhnik/nvim-gdb',
        config = function() require('plugins.gdb') end,
        run = ':!~/.local/share/nvim/site/pack/packer/start/nvim-gdb/install.sh',
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
    use { 'rmagatti/session-lens',
        requires = { 'rmagatti/auto-session' },
        config = function() require('plugins.session-lens') end,
    }

    -- Sync on first launch
    if packer_bootstrap then
        require('packer').sync()
    end
end)
