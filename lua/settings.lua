vim.cmd('filetype plugin on')
vim.cmd('syntax enable')
-- binary
vim.opt.spell = true
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.wildmenu = true -- tabcomplete
vim.opt.list = true -- show tabs and blankspace
vim.opt.nu = true
vim.opt.rnu = true -- line numbers
vim.opt.splitright = true
vim.opt.splitbelow = true
-- vim.opt.autowrite = true -- autowrite on :make
vim.opt.wrapscan = false
vim.opt.breakindent = true -- indent line wraps
vim.opt.undofile = true
vim.opt.hidden = true
-- values
vim.opt.scrolloff = 1
vim.opt.sidescrolloff = 5 -- min lines around cursor
vim.opt.complete = {'.', 'w', 'b', 'u'} -- completion
vim.opt.wildmode = {'longest:full', 'full'} -- tabcomplete
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4 -- default indentation
vim.opt.grepprg = [[rg\ --vimgrep\ --smart-case\ --follow]] -- use ripgrep as grep program
vim.opt.switchbuf = {'useopen', 'usetab', 'newtab'} -- Specify the behavior when switching between buffers
vim.opt.stal = 2
vim.opt.timeoutlen = 500
vim.opt.updatetime = 300
vim.opt.inccommand = 'split'
vim.opt.guifont = [[Fira\ Code]]
vim.opt.completeopt = {'menu', 'longest'}
vim.opt.colorcolumn = {80}
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.formatoptions:remove {'c', 'r', 'o'}  -- Don't insert comments on newline
-- nicer foldtext
_G.custom_fold_text = function()
    local line = vim.fn.getline(vim.v.foldstart)
    local foldedlinecount = string.format("%d", vim.v.foldend - vim.v.foldstart + 1)
    local count_padding = vim.fn['repeat'](' ', 3 - #foldedlinecount)
    return ' 📁 ' .. foldedlinecount .. count_padding .. line
end
vim.opt.foldtext = 'v:lua.custom_fold_text()'
vim.opt.fillchars = {fold = ' '}

vim.g.python3_host_prog = '~/venvs/pynvim/bin/python'
