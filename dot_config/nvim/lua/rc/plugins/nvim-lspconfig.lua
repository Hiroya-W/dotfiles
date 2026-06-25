return {
    "neovim/nvim-lspconfig",
    lazy = true,
    dependencies = {
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },
        { "aznhe21/actions-preview.nvim" },
        { "folke/lsp-colors.nvim" }, -- Automatically creates missing LSP highlights groups
        { "simrat39/rust-tools.nvim" },
        { "pmizio/typescript-tools.nvim" },
    },
    config = function()
        require("rc/lsp")
    end,
}
