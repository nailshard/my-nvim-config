local M = {}

M.setup = function()
    require('which-key').register({
        r = {
            name = '+refactor',
                e = {[[ <Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], 'extract'},
                f = {[[ <Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]], 'extract to file'},
                t = {[[ <Cmd>lua require('refactoring').refactors()<CR>]], 'refactors'},
        }
    }, {prefix = '<leader>', mode='v'})
end

M.config = function()
    local refactor = require("refactoring")
    refactor.setup()

    -- telescope refactoring helper
    local function telescope_refactor(prompt_bufnr)
        local content = require("telescope.actions.state").get_selected_entry(
            prompt_bufnr
        )
        require("telescope.actions").close(prompt_bufnr)
        require("refactoring").refactor(content.value)
    end
    refactor.refactors = function()
        require("telescope.pickers").new({}, {
            prompt_title = "refactors",
            finder = require("telescope.finders").new_table({
                results = require("refactoring").get_refactors(),
            }),
            sorter = require("telescope.config").values.generic_sorter({}),
            attach_mappings = function(_, map)
                map("i", "<CR>", telescope_refactor)
                map("n", "<CR>", telescope_refactor)
                return true
            end
        }):find()
    end
end

return M
