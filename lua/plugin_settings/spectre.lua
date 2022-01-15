local M = {}

M.config = function() -- {{{
    require('spectre').setup()
end -- }}}

M.setup = function() -- {{{
    local keymap = {s = {
        name = '+search',
        p = {':lua require("spectre").open()<CR>', 'spectre'},
    }}
    require('which-key').register(keymap, {prefix = '<leader>'})
end -- }}}

return M
