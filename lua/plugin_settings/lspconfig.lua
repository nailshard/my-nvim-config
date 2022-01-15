local M = {}
local diagnostics_enabled = true

vim.diagnostic.toggle = function()
    if diagnostics_enabled then
        vim.diagnostic.disable()
        diagnostics_enabled = false
    else
        vim.diagnostic.enable()
        diagnostics_enabled = true
    end
end

M.get_on_attach = function(lsp)
    return function(client, bufnr) -- {{{
        local wk = require("which-key")
        local opts = { noremap=true, silent=true }

        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

        buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
        require('lsp_signature').on_attach({
            bind = true, -- This is mandatory, otherwise border config won't get registered.
            floating_window = false, -- show hint in a floating window, set to false for virtual text only mode
        })
        vim.diagnostic.config({
            virtual_text = true,
            signs = true,
            float = {
                show_header = false,
                source = 'always',
            },
        })

        -- Mappings. {{{
        local keymap = {
            l = {
                name = "+lsp",
                i = {'<Cmd>lua vim.lsp.buf.implementation()<CR>', 'implementation'},
                t = {'<Cmd>lua vim.lsp.buf.type_definition()<CR>', 'type definition'},
                r = {'<Cmd>lua vim.lsp.buf.references()<CR>', 'references'},
                F = {'<Cmd>lua vim.lsp.buf.formatting()<CR>', 'format'},
                -- workspace
                a = {'<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', 'add workspace'},
                R = {'<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', 'remove workspace'},
                l = {'<Cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', 'list workspace'},
                -- show diagnostics
                d = {"<Cmd>lua vim.diagnostic.open_float(0, {scope='line'})<CR>", 'diagnostics'},
                -- toggle diagnostics
                v = {'<Cmd>lua vim.diagnostic.toggle()<CR>', 'toggle diagnostics'},
                -- code action
                q = {"<Cmd>lua vim.lsp.buf.code_action()<CR>", 'code action'},
                Q = {"<Cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", 'set loclist'},
                -- toggle bright comments
                c = {'<Cmd>lua R("funcs.highlight").toggle_bright_comments()<CR>', 'toggle bright comments'},
            },
            r = {
                name = "+refactor",
                -- rename
                n = {"<Cmd>lua vim.lsp.buf.rename()<CR>", 'rename (project)'},
            },
        }
        local visual_keymap = {l = {
            name = "+lsp",
            q = {"<Cmd>'<,'>lua vim.lsp.buf.range_code_action()<CR>", 'code action'},
        }}
        -- Set some keybinds conditional on server capabilities
        if client.resolved_capabilities.document_formatting then
            keymap.l.f = {"<Cmd>lua vim.lsp.buf.formatting()<CR>", 'format'}
        end
        if client.resolved_capabilities.document_range_formatting then
            visual_keymap.l.f = {"<Cmd>lua vim.lsp.buf.range_formatting()<CR>", 'format'}
        end
        wk.register(keymap, {prefix = '<leader>', buffer = bufnr})
        wk.register(visual_keymap, {prefix = '<leader>', buffer = bufnr, mode = 'v'})

        wk.register({
            -- show signature help
            s = {"<Cmd>lua vim.lsp.buf.signature_help()<CR>", 'lsp signature'},
            -- preview definition
            d = {"<Cmd>lua vim.lsp.buf.definition()<CR>", 'lsp definition'},
            D = {"<Cmd>lua vim.lsp.buf.declaration()<CR>", 'lsp declaration'},
        }, {prefix = 'g', buffer=bufnr})

        -- show hover doc
        buf_set_keymap('n', 'K', "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
        -- jump diagnostic
        buf_set_keymap('n', '[g', "<Cmd>lua vim.lsp.diagnostic.goto_prev({float = true})<CR>", opts)
        buf_set_keymap('n', ']g', "<Cmd>lua vim.lsp.diagnostic.goto_next({float = true})<CR>", opts)
        -- }}}

        -- close diagnostics etc
        buf_set_keymap('n', '<Esc>', '<Cmd>lua vim.lsp.buf.clear_references()<CR>', opts)

        -- Set autocommands conditional on server_capabilities
        if client.resolved_capabilities.document_highlight then
            vim.api.nvim_exec([[
                " TODO handle this
                " hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
                " hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
                " hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
                augroup lsp_document_highlight
                    autocmd! * <buffer>
                    " autocmd CursorHold <buffer> lua vim.lsp.diagnostic.show_line_diagnostics({show_header = false, focusable = false})
                    autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
                augroup END
            ]], false)
        end
        if lsp == 'efm' and vim.o.filetype == 'python' then
            client.resolved_capabilities.document_formatting = false
            client.resolved_capabilities.document_range_formatting = false
        end
    end -- }}}
end

M.config = function()
    local nvim_lsp = require('lspconfig')

    -- client capabilities
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    -- for cmp lsp
    local completionItem = capabilities.textDocument.completion.completionItem
    completionItem.snippetSupport = true
    completionItem.preselectSupport = true
    completionItem.insertReplaceSupport = true
    completionItem.labelDetailsSupport = true
    completionItem.deprecatedSupport = true
    completionItem.commitCharactersSupport = true
    completionItem.tagSupport = { valueSet = { 1 } }
    completionItem.resolveSupport = {
        properties = {
            'documentation',
            'detail',
            'additionalTextEdits',
        }
    }

    -- Use a loop to conveniently both setup defined servers
    -- and map buffer local keybindings when the language server attaches
    local servers = { -- {{{
        pyright = {
            flags = {
                debounce_text_changes = 150,
            },
        },
        rust_analyzer = {},
        vimls = {},
        bashls = {},
        dockerls = {},
        jsonls = {
            cmd = {'/usr/bin/vscode-json-languageserver'},
        },
        kotlin_language_server = {},
        texlab = {},
        yamlls = {},
        html = {},
        ccls = {
            -- init_options = {compilationDatabaseDirectory = "build"},
        },
        lemminx = {
            cmd = {'lemminx'},
        },
        sumneko_lua = { -- {{{
            cmd = {'lua-language-server'},
            settings = {
                Lua = {
                    runtime = {
                        version = 'LuaJIT',
                        path = vim.split(package.path, ';'),
                    },
                    diagnostics = {globals = {'vim'}},
                    workspace = {
                        library = {
                          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                        },
                    },
                },
            },
        }, -- }}}
        efm = { -- linters + formatters {{{
            cmd = {'efm-langserver'},
            init_options = {documentFormatting = false},
            filetypes = {
                "lua",
                "python",
                "vim",
                "make",
                "markdown",
                "rst",
                "yaml",
                "dockerfile",
                "sh",
                "json",
            },
        }, -- }}}
    } -- }}}
    for lsp, setup in pairs(servers) do
        setup.on_attach = M.get_on_attach(lsp)
        setup.capabilities = capabilities
        nvim_lsp[lsp].setup(setup)
    end

    -- colors and icons {{{
    -- TODO move elsewhere?
    vim.cmd('highlight! link LspDiagnosticsDefaultError WarningMsg')
    vim.fn.sign_define("LspDiagnosticsSignError", {
        texthl = "LspDiagnosticsSignError",
        text = "",
        numhl = "LspDiagnosticsSignError",
    })
    vim.fn.sign_define("LspDiagnosticsSignWarning", {
        texthl = "LspDiagnosticsSignWarning",
        text = "",
        numhl = "LspDiagnosticsSignWarning"
    })
    vim.fn.sign_define("LspDiagnosticsSignInformation", {
        texthl = "LspDiagnosticsSignInformation",
        text = "",
        numhl = "LspDiagnosticsSignInformation"
    })
    vim.fn.sign_define("LspDiagnosticsSignHint", {
        texthl = "LspDiagnosticsSignHint",
        text = "",
        numhl = "LspDiagnosticsSignHint"
    })
    -- }}}
end

return M
