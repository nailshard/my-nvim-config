local M = {}

M.setup = function() -- {{{
    local keymap = {
        U = {':MundoToggle<CR>', 'mundo toggle'},
    }
    require('which-key').register(keymap, {prefix = '<leader>'})
end -- }}}

return M
