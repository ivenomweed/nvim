local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

lspconfig.gopls.setup({
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            -- General settings
            completeUnimported = true,
            staticcheck = true,
            usePlaceholders = true,
            analyses = {
                fieldalignment = true,
                nilness = true,
                shadow = true,
                unusedparams = true,
                unusedwrite = true,
                useany = true,
            },
            codelenses = {
                generate = true,
                gc_details = true,
                regenerate_cgo = true,
                tidy = true,
                upgrade_dependency = true,
                vendor = true,
            },
            hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                variableTypes = true,
                rangeVariableTypes = true,
            },
            hoverKind = "FullDocumentation", -- or "SingleLine", "Structured"
            linkTarget = "pkg.go.dev",
            symbolMatcher = "fuzzy", -- or "caseSensitive", "exact"
            symbolStyle = "dynamic", -- or "full", "package"
            -- experimentalWorkspaceModule = true,
            gofumpt = true,

            -- Experimental features
            -- experimentalPostfixCompletions = true,
            -- experimentalUseInvalidMetadata = true,
            -- experimentalTemplateSupport = true,
            -- experimentalDiagnosticsDelay = "500ms",
            -- allowModfileModifications = true,
            -- allowImplicitNetworkAccess = true,

            -- Performance tuning
            -- memoryMode = "DegradeClosed", -- or "Normal", "DegradeOpened"
            matcher = "Fuzzy", -- or "CaseSensitive", "Exact"
            -- analysisMemoryLimit = 0, -- value in MB
        },
    },
})
