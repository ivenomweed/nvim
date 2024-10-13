local M = {}

local path = vim.fn.stdpath("config") .. "/lua/configs/lsp_configs/"
local handle = vim.loop.fs_scandir(path)
if handle then
    while true do
        local name, type = vim.loop.fs_scandir_next(handle)
        if not name then
            break
        end
        if name:match("%.lua$") and name ~= "init.lua" then
            local module_name = name:sub(1, -5) -- Remove .lua extension
            M[module_name] = require("configs.lsp_configs." .. module_name)
        end
    end
end

return M
