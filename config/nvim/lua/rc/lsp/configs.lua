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
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
for _, server in ipairs(servers) do
    local opts = {
        capabilities = capabilities
    }
    require('lspconfig')[server].setup {
        opts
    }
end
