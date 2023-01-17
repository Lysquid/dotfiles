local dap = require('dap')

-- Additional plugins
require('nvim-dap-virtual-text').setup {}
require('dap-python').setup('~/.local/share/nvim/mason/packages/debugpy/venv/bin/python')

-- Keymap functions

local first_launch = true
local function import_and_continue() -- Import launch.json the first time
    if first_launch then
        require('dap.ext.vscode').load_launchjs()
        first_launch = false
    end
    dap.continue()
end

local function conditional_breakpoint()
    dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
end

local function log_point()
    dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
end

-- Keymaps
vim.keymap.set('', '<F3>', '<Cmd>wa<CR><C-w>l<C-w>v<Cmd>terminal make<CR>i')
vim.keymap.set('t', '<F3>', '<C-u>make<CR>')
vim.keymap.set({ '', 't' }, '<F4>', dap.run_last)
vim.keymap.set({ '', 't' }, '<F5>', import_and_continue)
vim.keymap.set({ '', 't' }, '<S-F5>', dap.terminate)
vim.keymap.set({ '', 't' }, '<F10>', dap.step_over)
vim.keymap.set({ '', 't' }, '<F11>', dap.step_into)
vim.keymap.set({ '', 't' }, '<F12>', dap.step_into)
vim.keymap.set({ '', 't' }, '<F9>', dap.toggle_breakpoint)
vim.keymap.set({ '', 't' }, '<S-F9>', conditional_breakpoint)
vim.keymap.set({ '', 't' }, '<C-F9>', log_point)
vim.keymap.set({ '', 't' }, '<M-F9>', dap.clear_breakpoints)

-- Icons
vim.fn.sign_define('DapBreakpoint', { text = '', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointCondition', { text = '', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapLogPoint', { text = '', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointRejected', { text = '', texthl = '', linehl = '', numhl = '' })

-- Langage configuration

-- Cpp
dap.adapters.codelldb = {
    type = 'server',
    port = '${port}',
    executable = {
        command = 'codelldb',
        args = { '--port', '${port}' },
    }
}
-- Rename this adapter from codelldb to cpp for the json files to automatically select it
dap.adapters.cpp = dap.adapters.codelldb

dap.configurations.cpp = {
    {
        name = 'Launch file',
        type = 'codelldb',
        request = 'launch',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
    },
}

-- Use the same configuration for Rust and C
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
