-- automatically install
-- https://github.com/neovim/nvim-lspconfig/wiki/Installing-language-servers#automatically
local servers = {
    "sumneko_lua",
    "pylsp",
    -- "pyright",
    "rust_analyzer",
    "gopls",
    "clangd",
}

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})

local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
    ensure_installed = servers, -- ensure these servers are always installed
})

-- Setup lsp config
mason_lspconfig.setup_handlers({
    function(server_name)
        local opts = {
            on_attach = require("rc/lsp/handlers").on_attach,
            capabilities = require("rc/lsp/handlers").capabilities,
        }

        local has_custom_opts, server_custom_opts = pcall(require, "rc/lsp/settings/" .. server_name)
        if has_custom_opts then
            opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
        end

        if server_name == "rust_analyzer" then
            -- rust-tools send to options to lspconfig,
            -- and set up lspconfig automatically.
            require("rust-tools").setup({
                tools = opts.tools,
                server = {
                    on_attach = opts.on_attach,
                    capabilities = opts.capabilities,
                },
            })
        else
            require("lspconfig")[server_name].setup(opts)
        end
    end,
})

-- Unsupported LSPs by Mason
local unsupported_servers = {
    "satysfi-ls",
}

for _, server_name in ipairs(unsupported_servers) do
    local opts = {
        on_attach = require("rc/lsp/handlers").on_attach,
        capabilities = require("rc/lsp/handlers").capabilities,
    }

    local has_custom_opts, server_custom_opts = pcall(require, "rc/lsp/settings/" .. server_name)
    if has_custom_opts then
        opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
    end
    require("lspconfig")[server_name].setup(opts)
end
