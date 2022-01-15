local M = {}

M.config = function()
    require('pytrize').setup{
        no_commands = false,
        highlight = 'LineNr',
        preferred_input = 'builtin',
    }
end

return M
