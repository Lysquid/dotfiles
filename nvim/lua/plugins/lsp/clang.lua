require('lspconfig').clangd.setup {
    on_attach = On_attach,
    flags = Lsp_flags,
    cmd = {
        'clangd',
        '--background-index',
        '--pch-storage=memory',
        '--clang-tidy',
        '--suggest-missing-includes',
        '--all-scopes-completion',
        '-j=4',
        '--inlay-hints',
        '--header-insertion-decorators',
    },
}
