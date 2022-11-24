local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')

dashboard.section.buttons.val = {
    dashboard.button('e', '  New file', '<cmd>enew<CR>'),
    dashboard.button('SPC f s', '  Restore session'),
    dashboard.button('SPC h', '  Find file'),
    dashboard.button('SPC b', '﬘  Find buffer'),
    dashboard.button('SPC f o', '  Find in history'),
    dashboard.button('SPC f f', '  Find in git files'),
    dashboard.button('SPC f g', '  Find word'),
    dashboard.button('<C-g>', '  File browser'),
    dashboard.button('q', '  Quit NVIM', ':qa<CR>'),
}

alpha.setup(dashboard.config)
