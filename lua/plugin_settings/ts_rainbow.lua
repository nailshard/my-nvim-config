local M = {}

M.setup = function()
    _G.ts = {
        rainbow = {
            enabled = false,
            toggle = function()
                if ts.rainbow.enabled then
                    ts.rainbow.enable = false
                    require'nvim-treesitter.configs'.setup {
                        rainbow = {enable = false},
                    }
                else
                    ts.rainbow.enable = true
                    require'nvim-treesitter.configs'.setup {
                        rainbow = {enable = true},
                    }
                end
            end
        },
    }
    R('funcs.commands').define_commands({
        TSRainbowToggle = {nargs = 0, cmd = 'lua ts.rainbow.toggle()'},
    })
end

M.config = function()
    -- require'nvim-treesitter.configs'.setup {
    --     rainbow = {enable = true},
    -- }
    vim.cmd("highlight! link rainbowcol1 GruvboxOrangeBold")
    vim.cmd("highlight! link rainbowcol2 GruvboxPurpleBold")
    vim.cmd("highlight! link rainbowcol3 GruvboxBlueBold")
    vim.cmd("highlight! link rainbowcol4 GruvboxYellowBold")
    vim.cmd("highlight! link rainbowcol5 GruvboxAquaBold")
    vim.cmd("highlight! link rainbowcol6 GruvboxRedBold")
    vim.cmd("highlight! link rainbowcol7 GruvboxGrayBold")
end

return M
