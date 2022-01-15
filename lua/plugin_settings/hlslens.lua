local M = {}

M.setup = function() -- {{{
    local noremap = {noremap = true}
    local silent = {noremap = true, silent = true}
    vim.api.nvim_set_keymap('', 'n', '<Cmd>execute("normal! " . v:count1 . "n")<CR><Cmd>lua require("hlslens").start()<CR>', silent)
    vim.api.nvim_set_keymap('', 'N', '<Cmd>execute("normal! " . v:count1 . "N")<CR><Cmd>lua require("hlslens").start()<CR>', silent)
    vim.api.nvim_set_keymap('', '*', '*<Cmd>lua require("hlslens").start()<CR>', noremap)
    vim.api.nvim_set_keymap('', '#', '#<Cmd>lua require("hlslens").start()<CR>', noremap)
    vim.api.nvim_set_keymap('', 'g*', 'g*<Cmd>lua require("hlslens").start()<CR>', noremap)
    vim.api.nvim_set_keymap('', 'g#', 'g#<Cmd>lua require("hlslens").start()<CR>', noremap)
end -- }}}

return M
