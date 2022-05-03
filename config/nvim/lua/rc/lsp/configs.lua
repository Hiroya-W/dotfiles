local status_ok, _ = pcall(require, "nvim-lsp-installer")
if not status_ok then
    return
end

-- automatically install
-- https://github.com/neovim/nvim-lspconfig/wiki/Installing-language-servers#automatically
local servers = {"sumneko_lua", "rust_analyzer"}

require("nvim-lsp-installer").setup ({
    ensure_installed = servers,
})

for _, server in ipairs(servers) do
    require('lspconfig')[server].setup {}
end
