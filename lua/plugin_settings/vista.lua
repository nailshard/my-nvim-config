local M = {}

M.setup = function()
    require('which-key').register({v = {'<Cmd>Vista!!<CR>', 'toggle vista'}}, {prefix = '<leader>'})
end

return M
