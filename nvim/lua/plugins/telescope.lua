require('telescope').setup {
    defaults = {
        borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
        mappings = {
            i = {
                ['<C-q>'] = require('telescope.actions').close,
                ['<C-x>'] = require('telescope.actions').delete_buffer,
                ['<C-CR>'] = require('telescope.actions').select_vertical,
                ['<S-CR>'] = require('telescope.actions').select_horizontal,
            },
            n = {
                ['q'] = require('telescope.actions').close,
                ['<C-q>'] = require('telescope.actions').close,
                ['<C-x>'] = require('telescope.actions').delete_buffer,
                ['<C-CR>'] = require('telescope.actions').select_vertical,
                ['<S-CR>'] = require('telescope.actions').select_horizontal,
            },
        },
    },
}

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>b', builtin.buffers)
vim.keymap.set('n', '<leader>o', builtin.find_files)
vim.keymap.set('n', '<leader>s', builtin.lsp_document_symbols)

vim.keymap.set('n', '<leader>fg', builtin.live_grep)
vim.keymap.set('n', '<leader>ff', builtin.current_buffer_fuzzy_find)
vim.keymap.set('n', '<leader>fd', builtin.diagnostics)
vim.keymap.set('n', '<leader>fo', builtin.oldfiles)
vim.keymap.set('n', '<leader>fh', builtin.help_tags)
vim.keymap.set('n', '<leader>fr', builtin.lsp_references)
vim.keymap.set('n', '<leader>fi', builtin.lsp_implementations)
vim.keymap.set('n', '<leader>ft', builtin.builtin)
vim.keymap.set('n', '<leader>fc', builtin.git_commits)
vim.keymap.set('n', '<leader>fb', builtin.git_branches)

vim.keymap.set('n', '<leader>fe', function() builtin.find_files({ hidden = true, no_ignore = true }) end)
vim.keymap.set('n', '<leader>fs', require("auto-session.session-lens").search_session)
vim.keymap.set('n', '<leader>fp', require("telescope").extensions.yank_history.yank_history)

require('telescope').load_extension('fzf')
require('telescope').load_extension('yank_history')
