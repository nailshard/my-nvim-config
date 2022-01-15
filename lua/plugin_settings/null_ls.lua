local M = {}

M.config = function()
    local null_ls = require('null-ls')
    null_ls.setup({
        sources = {
            null_ls.builtins.formatting.isort,
            null_ls.builtins.formatting.autopep8,
        },
        on_attach = require('plugin_settings.lspconfig').get_on_attach('null_ls')
    })
end

return M
