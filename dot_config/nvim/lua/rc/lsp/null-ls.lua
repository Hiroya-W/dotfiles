local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

require("mason-null-ls").setup({
    ensure_installed = {
        "black",
        "isort",
        "stylua",
        "flake8",
        "mypy",
        "golangci_lint",
        "phpstan",
        "easy-coding-standard",
        "eslint_d",
        "prettierd",
        "yamllint",
        "markdownlint",
    },
    automatic_installation = false,
    handlers = {},
})

require("null-ls").setup({
    sources = {
        -- formatting
        -- Python
        formatting.black,
        formatting.isort,
        -- Lua
        formatting.stylua,
        -- PHP
        require("none-ls-ecs.formatting"),
        -- JS/TS
        formatting.prettierd,
        require("none-ls.diagnostics.eslint_d"),
        -- diagnostics
        -- Python
        diagnostics.flake8,
        diagnostics.mypy,
        -- Golang
        diagnostics.golangci_lint,
        diagnostics.yamllint,
        diagnostics.markdownlint,

        -- code_actions
        -- code_actions.refactoring,
        require("none-ls.code_actions.eslint_d"),
    },
    on_attach = require('lsp-format').on_attach
})
