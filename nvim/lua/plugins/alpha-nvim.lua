local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')

dashboard.section.buttons.val = {
    dashboard.button("e", "  New file", "<cmd>ene <CR>"),
    dashboard.button("SPC g", "  Find file"),
    dashboard.button("SPC b", "﬘  Find in buffer"),
    dashboard.button("SPC o", "  Find in history"),
    dashboard.button("SPC f g", "  Find word"),
    dashboard.button("SPC f c", "  Find in config"),
    dashboard.button("<C-g>", "  Open file explorer"),
    dashboard.button("q", "  Quit NVIM", ":qa<CR>"),
}

alpha.setup(dashboard.config)
