M = {}

local function noremap(keymap)
    local opts = {noremap = true}
    for lhs, rhs in pairs(keymap) do
        vim.api.nvim_set_keymap('', lhs, rhs, opts)
    end
end

local function unmap(keymap)
    for lhs, _ in pairs(keymap) do
        vim.api.nvim_del_keymap('', lhs)
    end
end

local colemak_keymap = {
    h = 'k',
    j = 'h',
    k = 'j',
}

local layout

M.enable_colemak = function()
    layout = "colemak"
    noremap(colemak_keymap)
end

M.disable_colemak = function()
    layout = "qwerty"
    unmap(colemak_keymap)
end

M.toggle_colemak = function()
    if layout == "colemak" then
        M.disable_colemak()
    else
        M.enable_colemak()
    end
end

return M
