local M = {}

M.setup = function()
    vim.g.sort_folds_ignore_case = true
    require('which-key').register({
        f = {
            name = '+folds',
            s = {'<Plug>SortFolds', 'sort'},
        },
    }, {prefix = '<leader>', mode='v', noremap=false})
end

return M
