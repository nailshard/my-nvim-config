local M = {}

M.config = function() -- {{{
    require('bqf').setup({func_map = {
        vsplit = '<C-S>',
    }})
end -- }}}

return M
