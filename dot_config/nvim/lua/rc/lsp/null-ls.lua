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
        -- diagnostics
        -- Python
        diagnostics.flake8,
        diagnostics.mypy,
        -- Golang
        diagnostics.golangci_lint,
        -- code_actions
        -- code_actions.refactoring,
    },
    -- you can reuse a shared lspconfig on_attach callback here
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ async = false })
                end,
            })
        end
    end,
})
