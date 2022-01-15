local au = R("funcs.autocmds")

au.define_autocmds({
    FileType = {
        ['*'] = {
            -- don't insert comments
            'setlocal formatoptions-=c formatoptions-=r formatoptions-=o',
            -- ftplugin
            'lua R("ftplugin").init()'
        },
    },
    TermOpen = {
        ['*'] = {
            -- automatically enter insert mode on new terminals
            'startinsert',
            'set nonu',
        },
    },
    TermClose = {
        ['*'] = {
            -- prevent term buffer from accidentally closing
            '++nested stopinsert | au TermEnter <buffer> stopinsert',
        },
    },
    BufReadPost = {
        ['*'] = {
            -- return to last edit position when opening files
            [[if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]],
        },
    },
    BufWritePost = {
        -- ['*.py'] = {
        --     -- auto format on save TODO how to handle if it's missing
        --     [[silent :%!darker-stdout % --isort]],
        -- },
        -- ['plugins.lua'] = {
        --     'PackerCompile',
        -- },
    },
    TextYankPost = {
        ['*'] = {
            'silent! lua vim.highlight.on_yank{higroup = "IncSearch", timeout = 150, on_visual = true}',
        },
    },
    -- use wrap scan only for first search
    -- augroup SearchWrap TODO use groups
    -- autocmd!
    CmdlineEnter = {
        ['[/?]'] = {'set wrapscan'},
    },
    CmdlineLeave = {
        ['[/?]'] = {'call timer_start(1, {-> execute("set nowrapscan")})'}
    },
    WinLeave = {
        ['*'] = {'set nocursorline nocursorcolumn'},
    },
    WinEnter = {
        ['*'] = {'set cursorline cursorcolumn'},
    },
    -- augroup END
})
