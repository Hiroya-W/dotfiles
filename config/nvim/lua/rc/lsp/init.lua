local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

require("rc/lsp/configs")
require("rc/lsp/handlers").setup()
