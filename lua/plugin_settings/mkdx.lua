local M = {}

M.setup = function()
    vim.g["mkdx#settings"] = {
        highlight = {enable = 1},
        enter = {shift = 1},
        links = {external = {enable = 1}},
        toc = {text = 'Table of Contents', update_on_write = 1},
        fold = {enable = 1},
    }
end

return M
