local wk = require("which-key")
local cm = R("funcs.commands")

return function()
    R('funcs.dedterm').setup{
        run = {
            cmd = "pdflatex &",
        },
    }
    local keymap = {
        o = {
            ':lua R("funcs.ft.tex").open()<CR><CR>',
            'open',
        },
        c = {
            ':lua R("funcs.ft.tex").clean()<CR><CR>',
            'clean',
        },
        R = {
            ':lua R("funcs.ft.tex").bib_compile()<CR>',
            'bib compile',
        },
    }

    wk.register(keymap, {prefix = '<localleader>', buffer = 0})

    cm.define_commands({
        LatexInstallPackages = {
            nargs = 0,
            cmd = "<Cmd>lua R('funcs.ft.tex').install_packages()",
            buffer = true,
        }
    })
end
