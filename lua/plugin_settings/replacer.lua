local M = {}

M.setup = function()
    local keymap = {q = {
        name = '+quickfix',
        r = {'<Cmd>lua require("replacer").run()<CR>', 'replacer'},
    }}
    require('which-key').register(keymap, {prefix = '<leader>'})
end

return M
