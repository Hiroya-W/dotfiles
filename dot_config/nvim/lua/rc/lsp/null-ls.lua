local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
-- local code_actions = null_ls.builtins.code_actions

require("mason-null-ls").setup({
    ensure_installed = {
        "black",
        "isort",
        "stylua",
        "flake8",
        "mypy",
        "golangci_lint",
        "phpstan", -- intelephense が phpstan を出してくれるのでバイナリだけ入れておく
        "easy-coding-standard"
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
        formatting.easy_coding_standard,
        -- diagnostics
        -- Python
        diagnostics.flake8,
        diagnostics.mypy,
        -- Golang
        diagnostics.golangci_lint,
        -- code_actions
        -- code_actions.refactoring,
    },
    on_attach = require('lsp-format').on_attach
})
