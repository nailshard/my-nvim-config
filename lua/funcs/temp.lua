local M = {}

M.new = function()
    local filetype = vim.bo.filetype
    if filetype == '' then
        filetype = 'python'
    end
    vim.cmd("tabnew " .. vim.fn.tempname())
    vim.bo.filetype = filetype
end

return M
