require('toggleterm').setup({
    open_mapping = '<C-x>',
    direction = 'vertical',
    size = function(term)
        if term.direction == "horizontal" then
            return 12
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.5
        end
    end,
    shade_terminals = true,
})
