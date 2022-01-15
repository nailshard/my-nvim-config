local M = {}

M.setup = function()
    local keymap = {
        g = {
            o = {':Octo<CR>', 'octo'},
        },
    }
    require('which-key').register(keymap, {prefix = '<leader>'})
end

M.config = function()
    require('octo').setup()
end

return M
