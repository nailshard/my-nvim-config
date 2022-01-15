local M = {}

M.config = function()
    require('neoscroll').setup({
        mappings = {
            '<C-u>',
            '<C-d>',
            -- '<C-b>',
            -- '<C-f>',
            '<C-y>',
            '<C-e>',
            'zt',
            'zz',
            'zb',
        },
    })

    local t = {}
    -- Syntax: t[keys] = {function, {function arguments}}
    t['<C-u>'] = {'scroll', {'-vim.wo.scroll', 'true', '75'}}
    t['<C-d>'] = {'scroll', { 'vim.wo.scroll', 'true', '75'}}
    -- t['<C-b>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '135'}}
    -- t['<C-f>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '135'}}
    t['<C-y>'] = {'scroll', {'-0.10', 'false', '30'}}
    t['<C-e>'] = {'scroll', { '0.10', 'false', '30'}}
    t['zt']    = {'zt', {'75'}}
    t['zz']    = {'zz', {'75'}}
    t['zb']    = {'zb', {'75'}}

    require('neoscroll.config').set_mappings(t)
end

return M
