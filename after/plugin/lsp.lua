print "hola"

local lsp = require "lsp-zero"
local luasnip = require('luasnip')

lsp.preset("recommended")

lsp.ensure_installed({
    "clangd",
    "eslint",
    "lua_ls",
    "solargraph",
})


lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
end)

-- When you don't have mason.nvim installed
-- You'll need to list the servers installed in your system
lsp.setup_servers({ 'clangd', 'eslint', 'solargraph', 'ruby_ls', 'sorbet', 'jdtls' })

lsp.setup()

-- You need to setup `cmp` after lsp-zero
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
cmp.setup({
    mapping = {
        -- `Enter` key to confirm completion
        ['<CR>'] = cmp.mapping.confirm({ select = true }),

        -- Ctrl+Space to trigger completion menu
        ['<C-Space>'] = cmp.mapping.complete(),

        -- Navigate between snippet placeholders
        ['<C-j>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
        ['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
        ['<C-l>'] = cmp.mapping(cmp.mapping.confirm({ select = true }), { 'i', 's' }),
        ['<C-f>'] = cmp.mapping(function(fallback)
            if vim.fn.pumvisible() == 1 then
                cmp.mapping.select_next_item()(fallback)
            else
                cmp.complete()
            end
        end, { 'i', 's' }),
        ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 's' }),
        ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 's' }),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
        -- Add other completion sources if needed
    },
})
