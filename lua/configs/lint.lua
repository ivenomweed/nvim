local lint = require("lint")
local lint_parser = require("lint.parser")

lint.linters_by_ft = {
    lua = { "luacheck" },
    go = { "golangcilint" },
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    group = lint_augroup,
    callback = function()
        lint.try_lint()
    end,
})

vim.keymap.set("n", "<leader>ll", function()
    lint.try_lint()
end, { desc = "Trigger linting for current file" })

lint.linters.luacheck = {
    cmd = "luacheck",
    stdin = true,
    args = {
        "--globals",
        "vim",
        "lvim",
        "reload",
        "--",
        "--formatter",
        "plain",
        "--codes",
        "--ranges",
        "-",
    },
    stream = "stdout",
    ignore_exitcode = true,
    parser = lint_parser.from_errorformat("%f:%l:%c: %m", {
        source = "luacheck",
    }),
}
