local status_ok, _ = pcall(require, "nvim-lsp-installer")
if not status_ok then
    return
end

-- automatically install
-- https://github.com/neovim/nvim-lspconfig/wiki/Installing-language-servers#automatically
local servers = {
    "sumneko_lua",
    "pylsp",
    "rust_analyzer",
    "gopls"
}

require("nvim-lsp-installer").setup({
    ensure_installed = servers, -- ensure these servers are always installed
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

-- Setup lspconfig.
for _, server in ipairs(servers) do
    local opts = {
        on_attach = require("rc/lsp/handlers").on_attach,
        capabilities = require("rc/lsp/handlers").capabilities
    }

    local has_custom_opts, server_custom_opts = pcall(require, "rc/lsp/settings/" .. server)
    if has_custom_opts then
        opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
    end

    if server == "rust_analyzer" then
        -- rust-tools send to options to lspconfig,
        -- and set up lspconfig automatically.
        require("rust-tools").setup {
            tools = opts.tools,
            server = {
                on_attach = opts.on_attach,
                capabilities = opts.capabilities
            }
        }
    else
        require('lspconfig')[server].setup(opts)
    end
end
