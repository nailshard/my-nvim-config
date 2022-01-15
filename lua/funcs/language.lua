M = {}

local function inoremap(keymap)
    local opts = {noremap = true}
    for lhs, rhs in pairs(keymap) do
        vim.api.nvim_buf_set_keymap(0, 'i', lhs, rhs, opts)
    end
end

local function iunmap(keymap)
    for lhs, _ in pairs(keymap) do
        vim.api.nvim_buf_del_keymap(0, 'i', lhs)
    end
end

local swedish_keymap = {
    [';'] =  '<C-k>o:',
    ['\''] = '<C-k>a:',
    ['['] =  '<C-k>aa',
    ['<A-;>'] =  ';',
    ['<A-\'>'] = '\'',
    ['<A-[>'] =  '[',
}

local language

M.enable_swedish = function()
    language = "sv"
    vim.o.spelllang = "sv"
    inoremap(swedish_keymap)
end

M.disable_swedish = function()
    language = "en"
    vim.o.spelllang = "en"
    iunmap(swedish_keymap)
end

M.toggle_swedish = function()
    if language == "sv" then
        M.disable_swedish()
    else
        M.enable_swedish()
    end
end

return M
