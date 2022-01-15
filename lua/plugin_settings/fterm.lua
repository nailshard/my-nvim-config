local M = {}

M.setup = function() -- {{{
    local opts = { noremap=true, silent=true }
    vim.api.nvim_set_keymap('n', '<A-d>', '<Cmd>lua require("FTerm").toggle()<CR>', opts)
    vim.api.nvim_set_keymap('t', '<A-d>', [[<C-\><C-n><Cmd>lua require("FTerm").toggle()<CR>]], opts)
    require('which-key').register({
        l = {
            g = {'<Cmd>lua require("FTerm").lazygit.toggle()<CR>', 'lazygit (float)'},
        },
        b = {
            t = {'<Cmd>lua require("FTerm").bpytop.toggle()<CR>', 'top (float)'},
            s = {'<Cmd>lua require("FTerm").spt.toggle()<CR>', 'spotify (float)'},
        },
    }, {prefix = '<leader>'})
end

M.config = function() -- {{{
    local fterm = require("FTerm")
    fterm.setup({
        dimensions = {
            height = 0.6,
            width = 0.8,
        },
    })

    local term = require("FTerm.terminal")
    local cmds = {
        lazygit = 'lazygit',
        bpytop = '/usr/bin/python /usr/bin/bpytop',
        spt = 'spt',
    }
    for name, cmd in pairs(cmds) do
        local prog = term:new():setup({
            cmd = cmd,
            dimensions = {
                height = 0.9,
                width = 0.8,
            },
        })
        fterm[name] = {
            toggle = function()
                prog:toggle()
            end,
        }
    end
end -- }}}

return M
