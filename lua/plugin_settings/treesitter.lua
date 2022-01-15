local M = {}

M.config = function()
    require'nvim-treesitter.configs'.setup {
        ensure_installed = "maintained",
        highlight = {enable = true, additional_vim_regex_highlighting = true},
        -- indentation = {enable = true},
        folding = {enable = true},
    }
    vim.cmd('autocmd TermOpen * TSBufDisable highlight')
end

return M
