local M = {}

M.setup = function() -- {{{
    local keymap = {p = {
        name = "+plugin",
        t = {"<Plug>PlenaryTestFile", "test file"},
    }}
    require('which-key').register(keymap, {prefix = '<leader>'})
end -- }}}

return M
