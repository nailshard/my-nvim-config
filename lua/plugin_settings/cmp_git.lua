local M = {}

M.config = function()
    require("cmp_git").setup{
        filetypes = { "gitcommit", "markdown" },
    }
end

return M
