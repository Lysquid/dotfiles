vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

local cmp = require('cmp')
local luasnip = require('luasnip')

-- Drop some default keymaps
vim.keymap.set({ 'i', 's' }, '<C-n>', '<nop>')
vim.keymap.set({ 'i', 's' }, '<C-p>', '<nop>')

local kind_icons = {
  Text = "",
  Method = "󰆧",
  Function = "󰊕",
  Constructor = "",
  Field = "󰇽",
  Variable = "󰂡",
  Class = "󰠱",
  Interface = "",
  Module = "",
  Property = "󰜢",
  Unit = "",
  Value = "󰎠",
  Enum = "",
  Keyword = "󰌋",
  Snippet = "",
  Color = "󰏘",
  File = "󰈙",
  Reference = "",
  Folder = "󰉋",
  EnumMember = "",
  Constant = "󰏿",
  Struct = "",
  Event = "",
  Operator = "󰆕",
  TypeParameter = "󰅲",
}

-- See :help cmp-config
cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    sources = cmp.config.sources({
        -- { name = 'luasnip' },
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'nvim_lua' },
    }, {
        { name = 'buffer' },
    }),
    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
            return vim_item
        end
    },
    -- See :help cmp-mapping
    mapping = {
        -- Doc
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),

        -- Trigger completion
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<Enter>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),

        -- Navigate completion results
        ['<Down>'] = cmp.mapping.select_next_item(),
        ['<Up>'] = cmp.mapping.select_prev_item(),

        -- Navigate snippet
        ['<C-n>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(1) then
                luasnip.jump(1)
            else
                fallback()
            end
        end, { 'i', 's' }),

        ['<C-p>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),

    },
})

local function format_no_description(entry, vim_item)
    vim_item.kind = ''
    return vim_item
end

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
        { name = 'git' }
    }, {
        { name = 'buffer' },
    }),
    formatting = {
        format = format_no_description
    }
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer', keyword_length = 3 }
    },
    formatting = {
        format = format_no_description
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline', keyword_length = 3 }
    }),
    formatting = {
        format = format_no_description
    }
})
