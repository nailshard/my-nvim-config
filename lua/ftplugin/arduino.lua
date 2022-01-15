return function()
    R('funcs.dedterm').setup{
        run = {
            cmd = "arduino-upload expand('%:p:h')",
        }
    }
end
