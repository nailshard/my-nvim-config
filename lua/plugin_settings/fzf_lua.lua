local M = {}

M.setup = function() -- {{{
    local keymap = {
        f = {
            z = {
                name = '+fzf-lua',
                p = {'<Cmd>lua require("fzf-lua").files()<CR>', 'files'},
                f = {'<Cmd>lua require("fzf-lua").builtin()<CR>', 'builtin'},
                l = {'<Cmd>lua require("fzf-lua").live_grep()<CR>', 'live grep'},
                b = {'<Cmd>lua require("fzf-lua").buffers()<CR>', 'buffers'},
                h = {'<Cmd>lua require("fzf-lua").help_tags()<CR>', 'help tags'},
                k = {'<Cmd>lua require("fzf-lua").keymaps()<CR>', 'keymaps'},
                o = {'<Cmd>lua require("fzf-lua").oldfiles()<CR>', 'old files'},
                s = {'<Cmd>lua require("fzf-lua").colorscheme()<CR>', 'colorscheme'},
                e = {'<Cmd>lua require("fzf-lua").symbols()<CR>', 'symbols'},
                m = {'<Cmd>lua require("fzf-lua").bookmarks()<CR>', 'marks'},
                c = {
                    name = '+commands',
                    c = {'<Cmd>lua require("fzf-lua").commands()<CR>', 'commands'},
                    h = {'<Cmd>lua require("fzf-lua").command_history()<CR>', 'history'},
                },
                q = {'<Cmd>lua require("fzf-lua").quickfix()<CR>', 'quickfix'},
                g = {
                    name = '+git',
                    g = {'<Cmd>lua require("fzf-lua").git_commits()<CR>', 'commits'},
                    c = {'<Cmd>lua require("fzf-lua").git_bcommits()<CR>', 'bcommits'},
                    b = {'<Cmd>lua require("fzf-lua").git_branches()<CR>', 'branches'},
                    s = {'<Cmd>lua require("fzf-lua").git_status()<CR>', 'status'},
                },
            },
            l = {
                name = '+lsp',
                e = {'<Cmd>lua require("fzf-lua").lsp_document_diagnostics()<CR>', 'lsp errors'},
                h = {'<Cmd>lua require("fzf-lua").lsp_references()<CR>', 'lsp references'},
            },
        },
    }
    require('which-key').register(keymap, {prefix = '<leader>'})
end -- }}}

return M
