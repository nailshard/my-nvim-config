local M = {}

M.config = function() -- {{{
    -- TODO use ftplugin
    -- local keymap = {e = {
    --     name = '+email',
    --     m = {'<Plug>(himalaya-mbox-input)', 'change mailbox'},
    --     p = {'<Plug>(himalaya-mbox-prev-page)', 'prev page'},
    --     n = {'<Plug>(himalaya-mbox-next-page)', 'next page'},
    --     w = {'<Plug>(himalaya-msg-write)', 'write'},
    --     R = {'<Plug>(himalaya-msg-reply)', 'reply'},
    --     r = {'<Plug>(himalaya-msg-reply-all)', 'reply all'},
    --     f = {'<Plug>(himalaya-msg-forward)', 'forward'},
    --     a = {'<Plug>(himalaya-msg-attachments)', 'attachments'},
    -- }}
    -- require("which-key").register(keymap, {prefix = '<leader>'})
end -- }}}

M.setup = function() -- {{{
    -- local keymap = {e = {
    --     name = '+email',
    --     o = {'<Cmd>Himalaya<CR>', 'open'},
    -- }}
    -- require("which-key").register(keymap, {prefix = '<leader>'})
end -- }}}

return M
