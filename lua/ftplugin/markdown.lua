local cm = R("funcs.commands")

return function()
    cm.define_commands({
        InsertImage = {
            nargs = 0,
            cmd = ":lua R('funcs.ft.markdown').insert_image()",
            buffer = true,
        }
    })
end
