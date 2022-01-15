local M = {}
local wk = require("which-key")
local cm = R("funcs.commands")

local function get_dedterm_cmd(opts, precmd, args)
    local cmd = ', "'..opts.cmd..'"'
    precmd = ', "'..precmd..'"'
    if args then args = ', {'..args..'}' else args = ', {}' end
    local post_args
    if opts.post_args then post_args = ', "'..opts.post_args..'"' else post_args = '' end
    local termname = '"'..vim.fn.substitute(vim.bo.filetype, '-term$', '', '')..'"'
    return 'lua R("funcs.terminal").dedicated('..termname..cmd..precmd..args..post_args..')'
end

local function setup_keymap(settings)
    local keymap = {}
    if (settings.run.cmd ~= nil) then
        keymap.r = {'<Cmd>wa<CR><Cmd>'..get_dedterm_cmd(settings.run, "tabnew")..'<CR>', 'run tab'}
        keymap.R = {'<Cmd>wa<CR><Cmd>'..get_dedterm_cmd(settings.run, "split")..'<CR>', 'run split'}
    end
    if (settings.test.cmd ~= nil) then
        keymap.t = {'<Cmd>wa<CR><Cmd>'..get_dedterm_cmd(settings.test, "tabnew")..'<CR>', 'test tab'}
        keymap.T = {'<Cmd>wa<CR><Cmd>'..get_dedterm_cmd(settings.test, "split")..'<CR>', 'test split'}
    end
    wk.register(keymap, {prefix = '<localleader>', buffer = 0})
end

local function setup_commands(settings)
    if settings.run.cmd ~= nil then
        cm.define_commands({
            Run = {nargs = '*' , cmd = get_dedterm_cmd(settings.run, "tabnew", '<f-args>')},
            RunSplit = {nargs = '*' , cmd = get_dedterm_cmd(settings.run, "split", '<f-args>')},
            RunVSplit = {nargs = '*' , cmd = get_dedterm_cmd(settings.run, "vsplit", '<f-args>')},
        })
    end
    if settings.test.cmd ~= nil then
        cm.define_commands({
            Test = {nargs = '*' , cmd = get_dedterm_cmd(settings.test, "tabnew", '<f-args>')},
            TestSplit = {nargs = '*' , cmd = get_dedterm_cmd(settings.test, "split", '<f-args>')},
            TestVSplit = {nargs = '*' , cmd = get_dedterm_cmd(settings.test, "vsplit", '<f-args>')},
        })
    end
end

M.setup = function(settings)
    settings = settings or {}
    settings.run = settings.run or {}
    settings.test = settings.test or {}

    setup_keymap(settings)
    setup_commands(settings)
end

return M
