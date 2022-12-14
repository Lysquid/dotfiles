require('nvim-treesitter.configs').setup {
    highlight = {
        enable = true,
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner',
            }
        },
        swap = {
            enable = true,
            swap_next = {
                ['<leader>a'] = '@parameter.inner',
            },
            swap_previous = {
                ['<leader>A'] = '@parameter.inner',
            },
        },
        lsp_interop = {
            enable = true,
            border = 'none',
            peek_definition_code = {
                ['<leader>cf'] = '@function.outer',
                ['<leader>cF'] = '@class.outer',
            },
        },
    },
    ensure_installed = {
        'bash',
        'c',
        'cmake',
        'comment',
        'cpp',
        'css',
        'diff',
        'fish',
        'git_rebase',
        'gitattributes',
        'gitcommit',
        'gitignore',
        'html',
        'lua',
        'make',
        'markdown',
        'markdown_inline',
        'python',
        'java',
        'javascript',
        'json',
        'sql',
        'yaml',
    },
}
