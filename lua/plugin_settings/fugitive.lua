local M = {}

M.setup = function() -- {{{
    local keymap = {
        name = '+git',
        d = {':Gdiffsplit!<CR>', 'diff fix'},
        h = {':diffget //2<CR>', 'diff get left'},
        l = {':diffget //3<CR>', 'diff get right'},
        g = {':GBrowse<CR>', 'browse'},
        c = {':Gclog!<CR>', 'git log qf'},
    }
    require('which-key').register({g = keymap}, {prefix = '<leader>'})
end -- }}}

return M
