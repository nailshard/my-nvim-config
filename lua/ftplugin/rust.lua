return function()
    R('funcs.dedterm').setup{
        run = {
            cmd = "cargo run",
        },
        test = {
            cmd = "cargo test",
        },
    }

    vim.bo.errorformat = ''..
        [[%-Gerror: aborting %.%#,]]..
        [[%-Gerror: Could not compile %.%#,]]..
        [[%Eerror: %m,]]..
        [[%Eerror[E%n]: %m,]]..
        [[%Wwarning: %m,]]..
        [[%Inote: %m,]]..
        [[%C %#--> %f:%l:%c,]]..
        [[%E  left:%m,%C right:%m %f:%l:%c,%Z,]]..
        [[%-G%.%#]]
end
