return function()
    R('funcs.dedterm').setup{
        run = {
            cmd = "!dot2tex -t math % > %:r.tex && pdflatex %:r.tex && open %:r.pdf",
        }
    }
    vim.bo.expandtab = false
    vim.bo.shiftwidth = 8
    vim.bo.softtabstop = 0
end
