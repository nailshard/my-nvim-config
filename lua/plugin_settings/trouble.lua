local M = {}

M.config = function()
    require("trouble").setup {}
end

M.setup = function()
    require('which-key').register({
        z = {
            name = '+trouble',
            z = {'<Cmd>TroubleToggle<CR>', 'toggle'},
            w = {'<Cmd>TroubleToggle lsp_workspace_diagnostics<CR>', 'workspace'},
            d = {'<Cmd>TroubleToggle lsp_document_diagnostics<CR>', 'diagnostics'},
            q = {'<Cmd>TroubleToggle quickfix<CR>', 'quickfix'},
            l = {'<Cmd>TroubleToggle loclist<CR>', 'loclist'},
            r = {'<Cmd>TroubleToggle lsp_references<CR>', 'references'},
        },
    }, {prefix = '<leader>'})
end

return M
