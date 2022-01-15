local function set_keymap(mode, opts, keymaps)
    for _, keymap in ipairs(keymaps) do
        vim.api.nvim_set_keymap(mode, keymap[1], keymap[2], opts)
    end
end

-- normal {{{1
set_keymap('n', {noremap=true, silent=true}, {
    -- remap leader keys to noop
    {' ', ''},
    {'\\', ''},
    {'+', ':ToggleAlternate<CR>'},
    
    -- execute q macro
    {'Q', '@q'},

    -- yank to end of line
    {'Y', 'y$'},

    -- yank/paste clipboard
    {'gy', '"+y'},
    {'gp', '"+p'},
    {'gP', '"+P'},
    {'gY', '"+y$'},

    -- source config
    {'<C-s>', ':lua R("funcs.source").config()<CR>'},

    -- Jump list
    {'[j', '<C-o>'},
    {']j', '<C-i>'},

    -- Smart way to move between windows
    {'<C-h>', '<C-w>h'},
    {'<C-j>', '<C-w>j'},
    {'<C-k>', '<C-w>k'},
    {'<C-l>', '<C-w>l'},

    -- Page down/up
    {'[d', '<PageUp>'},
    {']d', '<PageDown>'},

    -- Smart way to move between tabs
    {'<A-h>', 'gT'},
    {'<A-l>', 'gt'},

    -- Resize split
    {'<S-Up>', ':resize +2<CR>'},
    {'<S-Down>', ':resize -2<CR>'},
    {'<S-Left>', ':vertical resize +2<CR>'},
    {'<S-Right>', ':vertical resize -2<CR>'},

    -- Quickfix
    {'<Up>', ':copen<CR>'},
    {'<Down>', ':cclose<CR>'},
    {'<Left>', ':cprevious<CR>'},
    {'<Right>', ':cnext<CR>'},

    -- Navigate buffers
    -- {'<Tab>', ':bnext<CR>'},
    -- {'<S-Tab>', ':bprevious<CR>'},
})

-- visual {{{1
set_keymap('x', {noremap=true, silent=true}, {
    -- Allow pasting same thing many times
    {'p', '""p:let @"=@0<CR>'},

    -- better indent
    {'<', '<gv'},
    {'>', '>gv'},

    -- yank/paste clipboard
    {'gy', '"+y'},
    {'gp', '"+p'},

    -- Visual mode pressing * or # searches for the current selection
    {'*', ':<C-u>lua R("funcs.search").visual_selection("/")<CR>/<C-r>=@/<CR><CR>'},
    {'#', ':<C-u>lua R("funcs.search").visual_selection("?")<CR>?<C-r>=@/<CR><CR>'},

    -- move selected line(s)
    {'K', ':move \'<-2<CR>gv-gv'},
    {'J', ':move \'>+1<CR>gv-gv'},
})

-- insert {{{1
set_keymap('i', {noremap=true, silent=true}, {
    -- Smart way to move between tabs
    {'<A-h>', [[<C-\><C-n>gT]]},
    {'<A-l>', [[<C-\><C-n>gt]]},

    -- alternative esc
    {'jk', '<Esc>'},

    -- insert special carachters
    {'<C-b>', '<C-k>'},

    -- navigate display lines
    {'<Down>', '<Esc>gja'},
    {'<Up>', '<Esc>gka'},
})
-- set_keymap('i', {noremap=true, silent=true, expr=true}, {
--     -- Completion
--     {'<Tab>', [[pumvisible() ? "\<C-n>" : "\<C-x>\<C-o>"]]},
-- })

-- terminal {{{1
set_keymap('t', {noremap=true, silent=true}, {
    -- quickfix from buffer
    {'<C-q>', [[<C-\><C-n>:lua R("funcs.quicklist").create_from_buffer()<CR>]]},

    -- escape in terminal
    {'<Esc>', [[<C-\><C-n>]]},
    {'<A-[>', '<Esc>'},

    -- Smart way to move between windows
    {'<C-h>', [[<C-\><C-N><C-w>h]]},
    {'<C-j>', [[<C-\><C-N><C-w>j]]},
    {'<C-k>', [[<C-\><C-N><C-w>k]]},
    {'<C-l>', [[<C-\><C-N><C-w>l]]},

    -- Smart way to move between tabs
    {'<A-h>', [[<C-\><C-N>gT]]},
    {'<A-l>', [[<C-\><C-N>gt]]},
})

-- leader {{{1
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

local status, wk = pcall(require, "which-key")
if not (status) then
   return
end

-- normal {{{1
local which_key_map = {}
-- general
which_key_map['w'] = {'<Cmd>w<CR>', 'save file'}
which_key_map['W'] = {'<Cmd>wa<CR>', 'save all'}
which_key_map['x'] = {'<Cmd>q<CR>', 'quit file'}
which_key_map['X'] = {'<Cmd>qa<CR>', 'quit all'}
which_key_map['Q'] = {'<Cmd>wa<CR><Cmd>qa<CR>', 'save quit all'}
which_key_map['S'] = {'<Cmd>wa<CR><Cmd>mksession!<CR><Cmd>qa<CR>', 'save session quit all'}
which_key_map['<CR>'] = {':noh<CR>', 'no search hl'}
which_key_map['*'] = {'*<Cmd>lua R("funcs.search").vim("*."..vim.fn.expand("%:e"))<CR>', 'vimgrep cursor'}

-- buffers
which_key_map.b = {
    name = '+buffer',
    d = {':Bclose<CR>:tabclose<CR>gT', 'close'},
    a = {':bufdo bd<CR>', 'do'},
}

-- tabs
which_key_map.t = {
    name = '+tabs',
    n = {':tabnew<CR>', 'new'},
    t = {':tabnew %<CR><C-o>', 'new current'},
    N = {'<Cmd>lua R("funcs.temp").new()<CR>', 'new temp'},
    o = {':tabonly<CR>', 'close others'},
    c = {':tabclose<CR>', 'close'},
    m = {':tabmove ', 'move'},
    e = {':tabedit <C-r>=expand("%:p:h")<CR>/', 'edit cwd'},
    s = {'<Cmd>mksession!<CR>', 'save session'},
    l = {'<Cmd>source Session.vim<CR>', 'load session'},
}

-- quickfix
which_key_map.q = {
    name = '+quickfix',
    q = {':lua R("funcs.quicklist").create_from_buffer()<CR>', 'from buffer'},
    e = {':lua R("funcs.quicklist").estream_from_buffer()<CR>', 'from buffer'},
    G = {':clast<CR>', 'last'},
    g = {':cfirst<CR>', 'first'},
    c = {':cclose<CR>', 'close'},
    o = {':copen<CR>', 'open'},
}

-- make
which_key_map.m = {
    name = '+make',
    m = {':lua R("funcs.terminal").dedicated("make", "make", "tabnew")<CR>', 'make'},
    c = {':lua R("funcs.terminal").dedicated("make", "make clean", "tabnew")<CR>', 'clean'},
    a = {':lua R("funcs.terminal").dedicated("make", "make all", "tabnew")<CR>', 'all'},
    o = {':lua R("funcs.terminal").dedicated("make", "make open", "tabnew")<CR>', 'open'},
}

-- search
which_key_map.s = {
    name = '+search',
    f = {':lua R("funcs.search").vim("*."..vim.fn.expand("%:e"))<CR>', 'search project'},
    a = {':lua R("funcs.search").vim("*")<CR>', 'seach project all'},
    s = {':set operatorfunc=v:lua.grep.operator<CR>g@', 'grep operator'},
}

-- cwd
which_key_map.c = {
    name = '+cwd',
    d = {':cd %:p:h<CR>:pwd<CR>', 'cd to current'},
    l = {':lcd %:p:h<CR>:pwd<CR>', 'lcd to current'},
}

-- unicode
which_key_map.u = {
    name = '+unicode/color',
    t = {'<Cmd>lua R("funcs.unicode").replace_hex_to_char()<CR>', 'hx2ch'},
    f = {'<Cmd>lua R("funcs.unicode").replace_char_to_hex()<CR>', 'ch2hx'},
}

-- input/language
which_key_map.i = {
    name = '+input/language',
    s = {'<Cmd>lua R("funcs.language").toggle_swedish()<CR>', 'toggle sv'},
    c = {'<Cmd>lua R("funcs.layout").toggle_colemak()<CR>', 'toggle colemak'},
}

-- plugin/profile
which_key_map.p = {
    name = 'plugin',
    r = {'<Cmd>lua R("plugins")<CR>', 'load plugins conf'},
    p = {
        name = 'profile',
        s = {'<Cmd>ProfStart<CR>', 'profile start'},
        e = {'<Cmd>ProfStop<CR>', 'profile stop'},
    },
}

-- navigate
which_key_map.n = {
    name = 'navigation',
    x = {'<C-^>', 'alternative file'},
}


wk.register(which_key_map, {prefix = '<leader>'})

-- visual {{{1
local which_key_visual_map = {}
-- search
which_key_visual_map.s = {
    name = '+search',
    s = {':call v:lua.grep.operator(visualmode())<CR>', 'grep visual'},
}

wk.register(which_key_visual_map, {prefix = '<leader>', mode = 'v'})
