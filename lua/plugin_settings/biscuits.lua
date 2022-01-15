local M = {}

M.setup = function()
    require('which-key').register({
        l = {
            b = {'<Cmd>lua require("nvim-biscuits").toggle_biscuits()<CR>', 'toggle biscuits'},
        },
    }, {prefix = '<leader>'})
end

M.config = function()
    require('nvim-biscuits').setup({
        default_config = {
            max_length = 12,
            min_distance = 5,
            prefix_string = " 📎 "
        },
    })
end

return M
