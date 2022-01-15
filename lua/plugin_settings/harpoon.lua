local M = {}

M.setup = function() -- {{{
    require('which-key').register({
        e = {
            name = '+harpoon',
            n = {'<Cmd>lua require("harpoon.mark").add_file()<CR>', 'add file'},
            m = {'<Cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', 'toggle menu'},
            q = {'<Cmd>lua require("harpoon.ui").nav_file(1)<CR>', 'nav file 1'},
            w = {'<Cmd>lua require("harpoon.ui").nav_file(2)<CR>', 'nav file 2'},
            f = {'<Cmd>lua require("harpoon.ui").nav_file(3)<CR>', 'nav file 3'},
            p = {'<Cmd>lua require("harpoon.ui").nav_file(4)<CR>', 'nav file 4'},
            a = {'<Cmd>lua require("harpoon.term").gotoTerminal(1)<CR>', 'term 1'},
            r = {'<Cmd>lua require("harpoon.term").gotoTerminal(2)<CR>', 'term 2'},
            s = {'<Cmd>lua require("harpoon.term").gotoTerminal(3)<CR>', 'term 3'},
            t = {'<Cmd>lua require("harpoon.term").gotoTerminal(4)<CR>', 'term 4'},
            z = {'<Cmd>lua require("harpoon.term").sendCommand(1)<CR>', 'send 1'},
            x = {'<Cmd>lua require("harpoon.term").sendCommand(2)<CR>', 'send 2'},
            c = {'<Cmd>lua require("harpoon.term").sendCommand(3)<CR>', 'send 3'},
            v = {'<Cmd>lua require("harpoon.term").sendCommand(4)<CR>', 'send 4'},
        },
    }, {prefix = '<leader>'})
end -- }}}

return M
