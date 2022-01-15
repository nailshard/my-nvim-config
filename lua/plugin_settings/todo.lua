local M = {}

M.config = function() -- {{{
    vim.g.todo_load_python = true
    vim.g.todo_focus_initial_projects = {'work'}
    require('which-key').register({  -- TODO how to handle?
        s = {
            s = 'sort',
            ['@'] = 'sort_by_context',
            ['+'] = 'sort_by_project',
            d = {
                s = 'sort_by_date',
                d = 'sort_by_due_date',
            },
        },
        j = 'prioritize_increase',
        k = 'prioritize_decrease',
        a = 'prioritize_add A',
        b = 'prioritize_add B',
        c = 'prioritize_add C',
        d = 'date pick_date',
        x = 'mark_as_done',
        X = 'mark_all_as_done',
        D = 'remove_completed',
        n = {
            o = 'note open',
            d = 'note pop',
        },
        t = {
            to = 'subtasks open',
            td = 'subtasks pop',
        },
        l = {
            lo = 'link open',
            ld = 'link pop',
        },
        v = {
            vd = 'todokeys pop',
        },
        o = 'tasks insert_new("n", 0, 0)',
        O = 'tasks insert_new("n", 1, 0)',
        p = 'tasks insert_new("n", 0, 1)',
        P = 'tasks insert_new("n", 1, 1)',
        m = 'toggle_backlog',
        z = {
            zp = 'folding toggle_focus_project',
            zc = 'folding toggle_focus_context',
            zd = 'folding toggle_focus_due_date',
            zt = 'folding focus_query_tag',
        },
    }, {prefix = '<localleader>'})


    require('which-key').register({
        s = {
            s ='sort',
            ['@'] = 'sort_by_context',
            ['+'] = 'sort_by_project',
            d = {
                s = 'sort_by_date',
                d = 'sort_by_due_date',
            },
        },
        c = 'prioritize_add C',
        b = 'prioritize_add B',
        a = 'prioritize_add A',
        k = 'prioritize_decrease',
        j = 'prioritize_increase',
        x = 'mark_as_done',
        m = 'toggle_backlog(visualmode())',
    }, {prefix = '<localleader>', mode = 'v'})
end -- }}}

return M
