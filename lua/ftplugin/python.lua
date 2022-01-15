local wk = require("which-key")

return function()
    R('funcs.dedterm').setup{
        run = {
            cmd = "python",
            post_args = "%"
        },
        test = {
            cmd = "pytest",
            post_args = "%"
        },
    }

    wk.register({
        l = {
            name = 'lsp',
            f = {'<Cmd>%!darker-stdout % --isort<CR>', 'format darker'},
        },
    }, {prefix = '<leader>', buffer = 0})

    local keymap = {
        j = {':lua R("funcs.terminal").dedicated("jupyter", "jupyter notebook %", "tabnew")<CR>', 'open jupyter'},
        s = {':lua R("funcs.ft.python").toggle_f_string()<CR>', 'toggle f string'},
        f = {'<Cmd>wa<CR><Cmd>lua R("funcs.ft.python").test_function("tabnew")<CR>', 'test function'},
        p = {'<Cmd>wa<CR><Cmd>lua R("funcs.ft.python").test_cwd("tabnew")<CR>', 'test cwd'},
        F = {'<Cmd>wa<CR><Cmd>lua R("funcs.ft.python").test_function("split")<CR>', 'test function split'},
        P = {'<Cmd>wa<CR><Cmd>lua R("funcs.ft.python").test_cwd("split")<CR>', 'test cwd split'},
    }
    wk.register(keymap, {prefix = '<localleader>', buffer = 0})

    vim.bo.formatprg=[[autopep8 - | isort -d -]]

    vim.bo.makeprg = [[python\ %]]
    vim.bo.errorformat = ''..
        [[%*\sFile "%f"\, line %l\, %m,]]..
        [[%*\sFile "%f"\, line %l,]]..
        [[%f:%l: %m,]]..
        [[%f:%l:,]]..
        [[%-G%.%#]]
end
