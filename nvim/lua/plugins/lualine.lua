vim.opt.showmode = false

require('lualine').setup({
    options = { 
        theme = 'onedark',  -- 'material' is cool too
        icons_enabled = true,
        component_separators = '|',
        section_separators = '',
    }
})
