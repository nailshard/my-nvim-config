local M = {}

M.config = function() -- {{{
    require("hop").setup({})
end -- }}}

M.setup = function() -- {{{
    local keymap = {
        C = {"<Cmd>HopChar2<CR>", "hop char2"},
        [vim.g.mapleader] = {
            name = "hop",
            f = {"<Cmd>HopChar1<CR>", "hop char1"},
            c = {"<Cmd>HopChar2<CR>", "hop char2"},
            w = {"<Cmd>HopWord<CR>", "hop word"},
            l = {"<Cmd>HopLine<CR>", "hop line"},
            p = {"<Cmd>HopPattern<CR>", "hop pattern"},
        }
    }
    require('which-key').register(keymap, {prefix = '<leader>', silent = false})

    vim.api.nvim_set_keymap('n', '<CR>', '<Cmd>HopWord<CR>', {noremap = true})
    -- however not in command window
    -- remove <CR> mappings
    local unmap_cr = 'lua vim.api.nvim_buf_set_keymap(0, "n", "<CR>", "<CR>", {noremap = true})'
    R('funcs.autocmds').define_autocmds({
        CmdwinEnter = {
            ['*'] = {
                unmap_cr,
            },
        },
        FileType = {
            ['qf'] = {
                unmap_cr,
            },
        },
    })
end -- }}}

return M
