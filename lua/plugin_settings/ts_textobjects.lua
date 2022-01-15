local M = {}

M.setup = function()
    local keymap = {
        l = {
            p = {
                name = '+peek',
                f = 'function',
                c = 'class',
            },
        },
        H = {
            name = '+swap⬅',
            c = 'class',
            f = 'function',
            [','] = 'parameter',
        },
        L = {
            name = '+swap➡',
            c = 'class',
            f = 'function',
            [','] = 'parameter',
        },
    }
    require('which-key').register(keymap, {prefix = '<leader>'})
end

M.config = function()
    require "nvim-treesitter.configs".setup {
        textobjects = {
            select = {
                enable = true,
                keymaps = {
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner",
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    -- ['i,'] = "@parameter.inner",
                    -- ['a,'] = "@parameter.outer",
                },
                selection_modes = {
                    ["@class.outer"] = 'V',
                    ["@class.inner"] = 'V',
                    ["@function.outer"] = 'V',
                    ["@function.inner"] = 'V',
                }
            },
            swap = {
                enable = true,
                swap_next = {
                    ["<leader>Lc"] = "@class.inner",
                    ["<leader>Lf"] = "@function.inner",
                    ["<leader>L,"] = "@parameter.inner",
                },
                swap_previous = {
                    ["<leader>Hc"] = "@class.inner",
                    ["<leader>Hf"] = "@function.inner",
                    ["<leader>H,"] = "@parameter.inner",
                },
            },
            move = {
                enable = true,
                goto_next_start = {
                    ["]m"] = "@function.outer",
                    ["]]"] = "@class.outer",
                },
                goto_next_end = {
                    ["]M"] = "@function.outer",
                    ["]["] = "@class.outer",
                },
                goto_previous_start = {
                    ["[m"] = "@function.outer",
                    ["[["] = "@class.outer",
                },
                goto_previous_end = {
                    ["[M"] = "@function.outer",
                    ["[]"] = "@class.outer",
                },
            },
            lsp_interop = {
                enable = true,
                border = 'none',
                peek_definition_code = {
                    ["<leader>lpf"] = "@function.outer",
                    ["<leader>lpc"] = "@class.outer",
                },
            },
        },
    }
end

return M
