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
    use {'kyazdani42/nvim-web-devicons'}
    use {'joshdick/onedark.vim'}
    use {
        'nvim-lualine/lualine.nvim',
        config = function() pcall(require, 'plugins.lualine') end,
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

    -- Utilities
    use {'nvim-lua/plenary.nvim'}
end)

