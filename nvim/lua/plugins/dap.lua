local dap = require('dap')

-- Keymaps
vim.keymap.set({ '', 't' }, '<F3>', '<C-w>l<C-w>v<cmd>terminal<cr>iclear && make; exit<CR>')
vim.keymap.set({ '', 't' }, '<F4>', '<Cmd>lua require"dap".run_last()<CR>')
vim.keymap.set({ '', 't' }, '<F5>', '<Cmd>DapLoadLaunchJSON<CR><Cmd>lua require"dap".continue()<CR>')
vim.keymap.set({ '', 't' }, '<S-F5>', '<Cmd>lua require"dap".terminate()<CR>')
vim.keymap.set({ '', 't' }, '<C-F5>', '<Cmd>lua require"dap".terminate()<CR><Cmd>lua require"dap".run_last()<CR>')
vim.keymap.set({ '', 't' }, '<F10>', '<Cmd>lua require"dap".step_over()<CR>')
vim.keymap.set({ '', 't' }, '<F11>', '<Cmd>lua require"dap".step_into()<CR>')
vim.keymap.set({ '', 't' }, '<F12>', '<Cmd>lua require"dap".step_out()<CR>')
vim.keymap.set({ '', 't' }, '<F9>', '<Cmd>lua require"dap".toggle_breakpoint()<CR>')
vim.keymap.set({ '', 't' }, '<S-F9>', '<Cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')
vim.keymap.set({ '', 't' }, '<C-F9>', '<Cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>')
vim.keymap.set({ '', 't' }, '<M-F9>', '<Cmd>lua require"dap".clear_breakpoints()<CR>')

-- Icons
vim.fn.sign_define('DapBreakpoint', { text = '', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointCondition', { text = '', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapLogPoint', { text = '', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointRejected', { text = '', texthl = '', linehl = '', numhl = '' })

-- Cpp
dap.adapters.codelldb = {
    type = 'server',
    port = '${port}',
    executable = {
        command = '/usr/bin/codelldb',
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
