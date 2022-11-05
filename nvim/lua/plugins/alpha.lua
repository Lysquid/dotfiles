local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')

dashboard.section.buttons.val = {
    dashboard.button('e', '  New file', '<cmd>enew<CR>'),
    dashboard.button('SPC d', '  Find file'),
    dashboard.button('SPC b', '﬘  Find buffer'),
    dashboard.button('SPC o', '  Find in history'),
    dashboard.button('SPC f g', '  Find word'),
    dashboard.button('SPC f c', '  Find config'),
    dashboard.button('<C-g>', '  File browser'),
    dashboard.button('q', '  Quit NVIM', ':qa<CR>'),
}

alpha.setup(dashboard.config)
