local M = {}

M.config = function() -- {{{
    vim.g.gitblame_enabled = 0
    vim.g.gitblame_highlight_group = "GruvboxGray"
end -- }}}

M.setup = function() -- {{{
    local keymap = {
        name = '+git',
        b = {':GitBlameToggle<CR>', 'blame'},
    }
    require('which-key').register({g = keymap}, {prefix = '<leader>'})
end -- }}}

return M
