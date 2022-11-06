vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal'

require('auto-session').setup {
    log_level = 'error',
    auto_session_create_enabled = false,
    auto_save_enabled = true,
    auto_restore_enabled = true,
    pre_save_cmds = { ':wall' },
}
