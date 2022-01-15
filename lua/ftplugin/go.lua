return function()
    R('funcs.dedterm').setup{
        run = {
            cmd = "go run",
        },
        test = {
            cmd = "go test",
        },
    }
end
