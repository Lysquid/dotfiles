local dap = require('dap')
local dapui = require('dapui')

dapui.setup({
    layouts = {
        {
            elements = {
                -- Elements can be strings or table with id and size keys.
                'scopes',
                'breakpoints',
                'stacks',
                'watches',
            },
            size = 40, -- 40 columns
            position = 'left',
        },
        {
            elements = {
                { id = 'console', size = 0.5 },
                { id = 'repl', size = 0.5 },
            },
            size = 0.25, -- 25% of total lines
            position = 'bottom',
        },
    },
    controls = {
        enabled = false,
    },
})

-- Keymaps
vim.keymap.set({ '', 't' }, '<M-F5>', function() dapui.toggle {} end)

-- Auto launch and close
dap.listeners.after.event_initialized['dapui_config'] = function()
    dapui.open {}
end
dap.listeners.before.event_terminated['dapui_config'] = function()
    dapui.close {}
end
dap.listeners.before.event_exited['dapui_config'] = function()
    dapui.close {}
end
