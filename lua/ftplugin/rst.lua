return function()
    R('funcs.dedterm').setup{
        run = {
            cmd = "make html",
        },
    }
    vim.bo.expandtab = true
    vim.bo.tabstop = 8
    vim.bo.shiftwidth = 3
    vim.bo.softtabstop = 3
end
