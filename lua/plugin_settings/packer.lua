local M = {}

M.config = function()
    local keymap = {
        p = {
            name = "plugin",
            d = {"<Cmd>PackerClean<CR>", "packer clean"},
            c = {"<Cmd>PackerCompile<CR>", "packer compile"},
            i = {"<Cmd>PackerInstall<CR>", "packer install"},
            l = {"<Cmd>PackerLoad<CR>", "packer load"},
            p = {
                name = 'profile',
                p = {"<Cmd>PackerProfile<CR>", "packer profile"},
            },
            s = {"<Cmd>PackerStatus<CR>", "packer status"},
            S = {"<Cmd>PackerSync<CR>", "packer sync"},
            u = {"<Cmd>PackerUpdate<CR>", "packer update"},
        }
    }
    require("which-key").register(keymap, {prefix = '<leader>', silent = false})
end

return M
