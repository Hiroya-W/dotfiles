local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

require("null-ls").setup({
    sources = {
        -- formatting
        -- Python
        formatting.black,
        formatting.isort,
        -- diagnostics
        -- Python
        diagnostics.flake8,
        diagnostics.mypy,
        -- Golang
        diagnostics.golangci_lint,
        -- code_actions
        code_actions.refactoring,
    },
})
