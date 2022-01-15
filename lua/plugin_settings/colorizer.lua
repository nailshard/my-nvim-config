local M = {}

M.config = function() -- {{{
    require("colorizer").setup{}
end -- }}}

M.setup = function() -- {{{
    local keymap = {u = {
        name = '+unicode/color',
        c = {'<Cmd>ColorizerToggle<CR>', 'colorizer'},
    }}
    require('which-key').register(keymap, {prefix = '<leader>'})
end -- }}}

return M
