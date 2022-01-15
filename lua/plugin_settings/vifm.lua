local M = {}

M.setup = function() -- {{{
    local opts = {silent=true, noremap=true}
    vim.api.nvim_set_keymap('n', '<C-n>', ':Vifm<CR>', opts)

    local keymap = {
        name = '+navigation',
        d = {':DiffVifm<CR>', 'diff files'},
        s = {':SplitVifm<CR>', 'new file split'},
        v = {':VsplitVifm<CR>', 'new file v split'},
        t = {':TabVifm<CR>', 'new file tab'},
        f = {'<Cmd>VifmSelectFile<CR>', 'vifm select'},
    }

    require('which-key').register({n = keymap}, {prefix = '<leader>'})
end -- }}}

return M
