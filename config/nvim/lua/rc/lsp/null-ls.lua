local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

require("null-ls").setup({
    sources = {
        -- formatting
        formatting.black,
        -- diagnostics
        diagnostics.flake8,
        -- code_actions
        code_actions.refactoring,
    },
})
