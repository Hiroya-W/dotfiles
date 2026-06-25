return {
    "nvimdev/lspsaga.nvim", -- add UI for LSP
    event = "VimEnter",
    dependencies = {
        "neovim/nvim-lspconfig",
    },
    opts = {
        symbol_in_winbar = {
            enable = false,
        },
    },
}
