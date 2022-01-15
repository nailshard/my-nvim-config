local M = {}

M.config = function() -- {{{
    local dial = require("dial")
    dial.augends["custom#boolean"] = dial.common.enum_cyclic{
        name = "boolean",
        strlist = {"true", "false"},
    }
    dial.augends["custom#Boolean"] = dial.common.enum_cyclic{
        name = "boolean",
        strlist = {"True", "False"},
    }
    table.insert(dial.config.searchlist.normal, "custom#boolean")
    table.insert(dial.config.searchlist.normal, "custom#Boolean")

    local opts = {silent = true, noremap=false}
    vim.api.nvim_set_keymap('n', '<C-a>', '<Plug>(dial-increment)', opts)
    vim.api.nvim_set_keymap('n', '<C-x>', '<Plug>(dial-decrement)', opts)
    vim.api.nvim_set_keymap('v', '<C-a>', '<Plug>(dial-increment)', opts)
    vim.api.nvim_set_keymap('v', '<C-x>', '<Plug>(dial-decrement)', opts)
    vim.api.nvim_set_keymap('v', 'g<C-a>', '<Plug>(dial-increment-additional)', opts)
    vim.api.nvim_set_keymap('v', 'g<C-x>', '<Plug>(dial-decrement-additional)', opts)
end -- }}}

return M
