local M = {}

M.config = function() -- {{{
    local gitlinker_hosts = require("gitlinker.hosts")

    local callbacks = {}
    local has_gitlab_urls, gitlab_urls = pcall(vim.fn.readfile, vim.fn.expand('~/.config/nvim/lua/local/gitlinker_gitlab_urls.txt'))
    if has_gitlab_urls then
        for _, gitlab_url in ipairs(gitlab_urls) do
            callbacks[gitlab_url] = gitlinker_hosts.get_gitlab_type_url
        end
    end

    require"gitlinker".setup({
        mappings = "<Leader>gy", -- mapping to call url generation
        callbacks = callbacks
    })
end -- }}}

M.setup = function() -- {{{
    local keymaps = { g = {
        name = '+git',
        y = 'get link',
    }}
    require("which-key").register(keymaps, {prefix = '<leader>'})
end -- }}}

return M
