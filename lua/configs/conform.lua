local options = {
    formatters_by_ft = {
        lua = { "stylua" },
        go = { "gofumpt", "goimports", "golines" },
    },

    format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
        async = false,
    },
}

return options
