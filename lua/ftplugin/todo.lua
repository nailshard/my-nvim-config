return function()
    -- TODO
    -- vim.g.lightline['component_function'] = {
    --     todo = 'todo#folding#get_current_focus_str',
    -- }
    -- vim.fn.add(vim.g.lightline['active']['left'][1], 'todo')

    R("funcs.highlight").discrete_comments()
end
