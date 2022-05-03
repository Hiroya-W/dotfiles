local status_ok, _ = pcall(require, "nvim-lsp-installer")
if not status_ok then
    return
end

-- automatically install
-- https://github.com/neovim/nvim-lspconfig/wiki/Installing-language-servers#automatically
local servers = {"sumneko_lua", "rust_analyzer"}

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

    -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#sumneko_lua
    if server == "sumneko_lua" then
        local custom_opts = {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = {"vim"} -- For Undefined global 'vim'
                    }
                }
            }
        }
        opts = vim.tbl_deep_extend("force", opts, custom_opts)
    end

    require('lspconfig')[server].setup(opts)
end

