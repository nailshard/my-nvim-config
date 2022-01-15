local M = {}

M.setup = function() -- {{{
    local keymap = {
        name = '+navigation',
        -- z = {'<Cmd>Telescope zoxide list<CR>', 'z list'},
        z = {'<Cmd>lua require("telescope").extensions.zoxide.list()<CR>', 'z list'},
    }
    require('which-key').register({n = keymap}, {prefix = '<leader>'})
end -- }}}

return M
