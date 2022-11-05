vim.g.lf_replace_netrw = 1
vim.g.lf_width = 0.8
vim.g.lf_height = 0.8
vim.g.lf_map_keys = 0
vim.g.lf_command_override = 'lf -command "set hidden"'
vim.g.floaterm_title = ' lf '

vim.keymap.set('n', '<C-g>', '<cmd>Lf<cr>')

-- Same style as Telescope
vim.cmd(':highlight link Floaterm TelescopeNormal')
vim.cmd(':highlight link FloatermBorder TelescopeBorder')
