vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal'

require('auto-session').setup {
    log_level = vim.log.levels.ERROR,
    auto_session_create_enabled = false,
    auto_save_enabled = true,
    auto_restore_enabled = true,

    session_lens = {
        load_on_setup = true,
        theme_conf = require('telescope.themes').get_dropdown {
            winblend = 0;
            borderchars = {
                prompt = { '─', '│', ' ', '│', '┌', '┐', '│', '│' },
                results = { '─', '│', '─', '│', '├', '┤', '┘', '└' },
                preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
            },
        },
        previewer = false,
    },
}
