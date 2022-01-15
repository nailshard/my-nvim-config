local M = {}

M.setup = function() -- {{{
    local keymap = {
        K = {':Cheatsheet<CR>', 'cheatsheet'},
    }
    require('which-key').register(keymap, {prefix = '<leader>'})
end -- }}}

return M
