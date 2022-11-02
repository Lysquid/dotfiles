require('bufferline').setup({
    options = {
        mode = 'buffers',
        offsets = {
            {filetype = 'NvimTree'}
        },
        show_close_icon = true
    },
    highlights = {
        buffer_selected = {
            italic = false
        },
        indicator_selected = {
            fg = {attribute = 'fg', highlight = 'Function'},
            italic = false
        }
    }
})
