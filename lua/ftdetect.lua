local au = R("funcs.autocmds")

local function ftdetect(ftypes)
    local autocmds = {}
    for ftype, patterns in pairs(ftypes) do
        for _, pattern in ipairs(patterns) do
            autocmds[pattern] = {'set ft='..ftype}
        end
    end
    au.define_autocmds({['BufNewFile,BufRead'] = autocmds})
end

ftdetect({
    vim = {'vifmrc', '*.vifm'},
    dot = {'*.dot'},
    sage = {'*.sage'},
    arduino = {'*.ino'},
})
