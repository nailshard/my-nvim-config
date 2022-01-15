local M = {}

M.setup = function()
    require('which-key').register({
        r = {
            name = 'rename',
            n = 'rename',
        },
        d = 'goto definition',
        n = {D = 'list definitions'},
        O = 'list definitions toc',
    }, {prefix = 'g'})
end

M.config = function()
    require'nvim-treesitter.configs'.setup {
        refactor = {
            highlight_definitions = { enable = false },
            highlight_current_scope = { enable = false },
            smart_rename = {
                enable = true,
                keymaps = {
                    smart_rename = "grn",
                },
            },
            navigation = {
                enable = true,
                keymaps = {
                    goto_definition = '<Nop>',
                    goto_definition_lsp_fallback = "gnd",
                    list_definitions = "gnD",
                    list_definitions_toc = "gO",
                    -- goto_next_usage = "<a-*>",
                    -- goto_previous_usage = "<a-#>",
                },
            },
        },
    }
end

return M
