local M = {}

M.setup = function() -- {{{
    local keymap = {
        u = {
            name = '+boxes',
            v = {':VBox<CR>', 'draw box'},
            d = {':VBoxD<CR>', 'draw box (double)'},
            h = {':VBoxH<CR>', 'draw box (thick)'},
            c = {
                name = '+crossing',
                v = {':VBoxO<CR>', 'draw (crossing) box'},
                d = {':VBoxDO<CR>', 'draw (crossing) box (double)'},
                h = {':VBoxHO<CR>', 'draw (crossing) box (thick)'},
            },
        },
    }
    require('which-key').register(keymap, {prefix = '<leader>', mode = 'v'})
end -- }}}

return M
