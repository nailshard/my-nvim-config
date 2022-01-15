local M = {}

M.config = function()
    require("which-key").setup{
        plugins = {
            spelling = {enabled = true},
            presets = {
                operators = false,
                motions = false,
            },
        },
        ignore_missing = true,
        triggers_blacklist = {
            -- list of mode / prefixes that should never be hooked by WhichKey
            -- this is mostly relevant for key maps that start with a native binding
            -- most people should not need to change this
            n = {"s"},
            i = {"j", "k"},
            v = {"j", "k", "s"},
            x = {"s"},
        },
    }
end

return M
