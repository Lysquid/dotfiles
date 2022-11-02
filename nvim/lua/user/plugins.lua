local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)

    -- Plugin manager
    use {'wbthomason/packer.nvim'}

    -- Theming
    use {'joshdick/onedark.vim'}
    use {'folke/tokyonight.nvim'}
    use {'ellisonleao/gruvbox.nvim'}
    use {'kyazdani42/nvim-web-devicons'}
    use {
        'nvim-lualine/lualine.nvim',
        config = function() pcall(require, 'plugins.lualine') end,
    }
    use {
        'akinsho/bufferline.nvim',
        config = function() pcall(require, 'plugins.bufferline') end,
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
    use {'tpope/vim-fugitive'}

    -- Code manipulation
    use {
        'nvim-treesitter/nvim-treesitter',
        config = function() pcall(require, 'plugins.treesitter') end,
    }
    use {'nvim-treesitter/nvim-treesitter-textobjects'}
    use {
        'numToStr/Comment.nvim',
        config = function() pcall(require, 'plugins.comment') end,
    }
    use {'tpope/vim-surround'}
    use {'wellle/targets.vim'}
    use {'tpope/vim-repeat'}

    -- Utilities
    use {'moll/vim-bbye'}
    use {'nvim-lua/plenary.nvim'}
    use {'editorconfig/editorconfig-vim'}
    use {
        'akinsho/toggleterm.nvim',
        config = function() pcall(require, 'plugins.toggleterm') end,
    }
    use {'ggandor/leap.nvim'}
    require('leap').add_default_mappings()

    -- File explorer
    use {
        'ptzz/lf.vim',
        requires = {'voldikss/vim-floaterm'}
    }
    use {
        'kyazdani42/nvim-tree.lua',
        config = function() pcall(require, 'plugins.nvim-tree') end,
        opt = true,
    }
end)

