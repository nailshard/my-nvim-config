local M = {}

M.config = function() -- {{{
    require("project_nvim").setup{
        silent_chdir = false,
        -- ignore_lsp = {"efm"},
        exclude_dirs = {"/tmp/*"},
    }
end -- }}}

return M
