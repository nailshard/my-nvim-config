local M = {}

M.setup = function()
    vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
    vim.fn.sign_define('DapStopped', {text='🚏', texthl='', linehl='', numhl=''})
    vim.g.dap_virtual_text = true

    local keymap = {
        name = '+debug',
        c = {'<Cmd>lua require"dap".continue()<CR>', 'continue'},
        l = {'<Cmd>lua require"dap".run_last()<CR>', 'run last'},
        h = {'<Cmd>lua require"dap".stop()<CR>', 'stop'},
        n = {'<Cmd>lua require"dap".step_over()<CR>', 'step over'},
        s = {'<Cmd>lua require"dap".step_into()<CR>', 'step into'},
        S = {'<Cmd>lua require"dap".step_out()<CR>', 'step out'},
        b = {'<Cmd>lua require"dap".toggle_breakpoint()<CR>', 'toggle br'},
        B = {'<Cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', 'set br condition'},
        p = {'<Cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>', 'set log br'},
        r = {'<Cmd>lua require"dap".repl.open()<CR>', 'REPL open'},
        k = {'<Cmd>lua require"dap".up()<CR>', 'up callstack'},
        j = {'<Cmd>lua require"dap".down()<CR>', 'down callstack'},
        i = {'<Cmd>lua require"dap.ui.widgets".hover()<CR>', 'info'},
        ['?'] = {'<Cmd>lua local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes)<CR>', 'scopes'},
        f = {'<Cmd>Telescope dap frames<CR>', 'search frames'},
        C = {'<Cmd>Telescope dap commands<CR>', 'search commands'},
        L = {'<Cmd>Telescope dap list_breakpoints<CR>', 'search breakpoints'},
    }
    require('which-key').register({d = keymap}, {prefix = '<leader>'})
end

M.config = function()
    local dap = require('dap')
    dap.adapters.python = {
        type = 'executable',
        command = 'python',
        args = {'-m', 'debugpy.adapter'},
    }
    dap.configurations.python = {
        {
            type = 'python',
            request = 'launch',
            name = "Launch file",
            program = "${file}",
            pythonPath = function() return '/usr/bin/python' end,
        },
    }
end

return M
