P = function(thing)
    print(vim.inspect(thing))
    return thing
end

local modules = {}

UnloadModules = function()
    for module, _ in pairs(modules) do
        package.loaded[module] = nil
    end
end

R = function(module)
    modules[module] = true
    return require(module)
end
