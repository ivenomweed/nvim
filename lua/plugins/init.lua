return {
    {
        "stevearc/conform.nvim",
        event = "BufWritePre",
        opts = require("configs.conform"),
    },
    {
        "mfussenegger/nvim-lint",
        event = { "BufWritePre", "BufNewFile" },
        config = function()
            require("configs.lint")
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "vim",
                "lua",
                "vimdoc",
                "html",
                "css",
                "go",
            },
        },
    },
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            {
                "leoluz/nvim-dap-go",
                ft = "go",
                config = function(_, opts)
                    require("dap-go").setup(opts)
                end,
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },
            { "neovim/nvim-lspconfig" },
            { "zapling/mason-conform.nvim" },
            { "rshkarin/mason-nvim-lint" },
        },
        config = function()
            require("configs.lspconfig")
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            local gwidth = vim.api.nvim_list_uis()[1].width
            local gheight = vim.api.nvim_list_uis()[1].height
            local width = 60
            local height = 20
            require("nvim-tree").setup({
                view = {
                    width = width,
                    float = {
                        enable = true,
                        open_win_config = {
                            relative = "editor",
                            width = width,
                            height = height,
                            row = (gheight - height) * 0.4,
                            col = (gwidth - width) * 0.5,
                        },
                    },
                },
            })
        end,
    },
    {
        "olexsmir/gopher.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "mfussenegger/nvim-dap", -- (optional) only if you use `gopher.dap`
        },
        ft = "go",
        config = function(_, opts)
            require("gopher").setup(opts)
        end,
        build = function()
            vim.cmd([[silent! GoInstallDeps]])
        end,
    },
}
