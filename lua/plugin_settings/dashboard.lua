local M = {}

M.setup = function() -- {{{
    vim.g.dashboard_default_executive = 'telescope'
    vim.g.dashboard_custom_header = {
        [[          /\                                                               ]],
        [[         /**\                                                              ]],
        [[        /****\   /\                                                        ]],
        [[       /      \ /**\                                                       ]],
        [[      /  /\    /    \        /\    /\  /\      /\            /\/\/\  /\    ]],
        [[     /  /  \  /      \      /  \/\/  \/  \  /\/  \/\  /\  /\/ / /  \/  \   ]],
        [[    /  /    \/ /\     \    /    \ \  /    \/ /   /  \/  \/  \  /    \   \  ]],
        [[___/__/_____/_/__\_____\___________________________________________________]],
    }
    vim.g.dashboard_custom_section = function()
        local custom_section = {}
        for i, folder in ipairs(vim.fn.systemlist('common-git-repos -n 9')) do
            local git_branch = vim.fn.system('(cd '..folder..' && git symbolic-ref --short HEAD 2> /dev/null)')
            git_branch = string.sub(git_branch, 1, -2)
            local is_git_dirty = vim.fn.system('(cd '..folder..' && git status --porcelain 2> /dev/null | tail -1)') ~= ''
            local git_status_icon
            if is_git_dirty then
                git_status_icon = '✘'
            else
                git_status_icon = '✔'
            end
            local inner_whitespace = string.rep(' ', 50 - string.len(folder))
            local git_status = ' ('..git_branch..' '..git_status_icon..')'
            local post_whitespace = string.rep(' ', 20 - string.len(git_status))
            custom_section[string.format('folder%d', i)] = {
                description = {'  ' .. folder .. inner_whitespace .. git_status .. post_whitespace},
                command = 'silent! cd ' .. folder .. ' | enew | Telescope find_files',
            }
        end
        return custom_section
    end
    -- vim.g.dashboard_custom_section = custom_section
    vim.g.dashboard_custom_footer = {
        'It is not the mountain we conquer, but ourselves (Edmund Hillary)',
    }

    R('funcs.autocmds').define_autocmds({
        FileType = {
            ['dashboard'] = {
                'nnoremap <silent> <buffer> i :enew<CR>',
                'syntax region DashboardGitClean start=/(.*✔)/ end=/$/',
                'syntax region DashboardGitDirty start=/(.*✘)/ end=/$/',
                'highlight! link DashboardGit GruvboxPurple',
                'highlight! link DashboardGitClean GruvboxGreen',
                'highlight! link DashboardGitDirty GruvboxRed',
                'highlight! link DashboardFooter GruvboxAqua',
                'highlight! link DashboardCenter GruvboxPurple',
            },
        },
    })
end -- }}}

return M
