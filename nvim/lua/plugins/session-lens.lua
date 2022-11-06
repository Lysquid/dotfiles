require('session-lens').setup {
    theme_conf = require("telescope.themes").get_dropdown {
        borderchars = {
            prompt = { "─", "│", " ", "│", '┌', '┐', "│", "│" },
            results = { "─", "│", "─", "│", "├", "┤", '┘', '└' },
            preview = { "─", "│", "─", "│", '┌', '┐', '┘', '└' },
        },
    }
}
