local M = {}

M.config = function() -- {{{
    require('which-key').register({
        f = {
            x = {'<Cmd>lua require("telescope").extensions.neoclip.default()<CR>', 'neoclip'},
            z = {
                x = {'<Cmd>lua require("neoclip.fzf")()<CR>', 'neoclip'},
            }
        },
    }, {prefix = '<leader>'})
    require('neoclip').setup{
        history = 20,
        enable_persistant_history = true,
    }
end -- }}}

return M
