local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')

dashboard.section.buttons.val = {
    dashboard.button('e', '  Edit a new file', '<cmd>enew<CR>'),
    dashboard.button('SPC o', '󰍉  Open file'),
    dashboard.button('SPC g', '󰊢  Git files search'),
    dashboard.button('SPC b', '  Buffer search'),
    dashboard.button('SPC s', '  Symbol search'),
    dashboard.button('SPC f g', '  Find with grep'),
    dashboard.button('SPC f s', '  Find session'),
    dashboard.button('SPC f o', '󰋚  Find in old files'),
    dashboard.button('SPC f h', '󰘥  Find help'),
    dashboard.button('<C-g>', '  Go to browser'),
    dashboard.button('q', '  Quit neovim', '<Cmd>quit<CR>'),
}

alpha.setup(dashboard.config)
