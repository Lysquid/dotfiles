require("yanky").setup({
    system_clipboard = {
        sync_with_ring = false,
    },
})

-- Required mappings
vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")

-- Cycle through yank history after pasting
vim.keymap.set("n", "<A-n>", "<Plug>(YankyCycleForward)")
vim.keymap.set("n", "<A-p>", "<Plug>(YankyCycleBackward)")
