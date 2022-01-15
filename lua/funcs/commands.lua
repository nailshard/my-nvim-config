local M = {}

-- TODO update when api supports
M.define_commands = function(commands)
    for name, c in pairs(commands) do
        local command
        if c.buffer then
            command = 'command!-buffer'
        else
            command = 'command!'
        end
        vim.cmd(command..' -nargs='..c.nargs..' '..name..' '..c.cmd)
    end
end

return M
