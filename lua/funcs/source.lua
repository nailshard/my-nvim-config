local M = {}

M.config = function()
    UnloadModules()
--    vim.cmd("!make -C ~/dev/config > /dev/null")
    vim.cmd("luafile ~/.config/nvim/init.lua")
    R('plugins')
    vim.cmd("PackerCompile")
    print('Config reloaded 🎉')
end

return M
