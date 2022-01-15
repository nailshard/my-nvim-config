local M = {}

M.config = function()
    local cmp = require('cmp')
    cmp.setup {
        mapping = {
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-u>'] = cmp.mapping.scroll_docs(4),
            ['<C-e>'] = cmp.mapping.close(),
            ['<C-k>'] = function(fallback)
                if require('luasnip').jumpable() then
                    vim.cmd('lua require("luasnip").jump()')
                elseif require("cmp").visible() then
                    if require('luasnip').expandable() then
                        vim.cmd('lua require("luasnip").expand()')
                    else
                        cmp.mapping.confirm({ select = true })(fallback)
                    end
                else
                    cmp.mapping.complete()(fallback)
                end
            end
        },
        sources = {
            { name = "nvim_lua"},
            { name = "nvim_lsp"},
            -- { name = "path", max_item_count = 3 },
            { name = "luasnip" },
            -- { name = "buffer", keyword_length = 3},
            { name = "cmp_git" },
        },
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end,
        },
        formatting = {
            format = require('lspkind').cmp_format {
                with_text = true,
                menu = {
                    nvim_lua = "[Lua]",
                    nvim_lsp = "[LSP]",
                    -- path = "[Path]",
                    luasnip = "[LuaSnip]",
                    -- buffer = "[Buffer]",
                    cmp_git = "[Git]",
                },
            },
        },
        completion = {
            autocomplete = false,
        },
        experimental = {
            native_menu = false,
            ghost_text = {
                hl_group = 'Nontext',
            },
        },
    }
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
    -- -- Use buffer source for `/`.
    -- cmp.setup.cmdline('/', {
    --     sources = {
    --         { name = 'buffer' }
    --     }
    -- })

    -- -- Use cmdline & path source for ':'.
    -- cmp.setup.cmdline(':', {
    --     sources = cmp.config.sources({
    --         { name = 'path' }
    --     }, {
    --         { name = 'cmdline' }
    --     })
    -- })
end

return M
