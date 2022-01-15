local highlight = {}

highlight.use_bright_comments = true

-- func
highlight.discrete_comments = function()
    local colors = require("nvim-base16.colors")
    vim.cmd('highlight Comment guifg='..colors.base03 ..' gui=italic')
end

highlight.bright_comments = function()
    local colors = require("nvim-base16.colors")
    vim.cmd('highlight Comment guifg='..colors.base0F ..' gui=bold,italic')
end

highlight.toggle_bright_comments = function()
    highlight.use_bright_comments = not highlight.use_bright_comments
    if highlight.use_bright_comments then
        highlight.bright_comments()
    else
        highlight.discrete_comments()
    end
end

return highlight
