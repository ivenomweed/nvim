require("nvchad.options")

-- add yours here!
local o = vim.o
o.cursorlineopt = "both" -- to enable cursorline!
vim.g.toggle_theme_icon = ""
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
o.relativenumber = true

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true, { bufnr = 0 })
        end
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "NvimTree",
    callback = function()
        vim.api.nvim_buf_set_keymap(0, "n", "<Esc>", ":NvimTreeClose<CR>", { noremap = true, silent = true })
    end,
})
