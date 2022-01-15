local cm = R("funcs.commands")

cm.define_commands({
    -- :W sudo saves the file
    -- (useful for handling the permission-denied error)
    W = {nargs = 0 , cmd = 'w !sudo tee % > /dev/null'},

    -- profiling
    ProfStart = {nargs = 0 , cmd = 'lua R("funcs.profiling").start("vim-profile.log")'},
    ProfStop = {nargs = 0 , cmd = 'lua R("funcs.profiling").stop()'},

    -- swap
    SwapDiff = {nargs = 0 , cmd = 'lua R("funcs.swap").diff()'},
    SwapClear = {nargs = 0 , cmd = 'lua R("funcs.swap").clear()'},

    -- select file using vifm
    VifmSelectFile = {nargs = 0 , cmd = 'lua R("funcs.fileselect").select()'},

    -- Browse
    Browse = {nargs = 1 , cmd = 'lua R("funcs.browse").browse(<args>)'},
})
