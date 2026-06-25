return {
    "folke/trouble.nvim", -- UI for diagnostics, references,...
    cmd = { "Trouble" },
    dependencies = {
        "kyazdani42/nvim-web-devicons",
    },
    keys = {
        {
            "<leader>cw",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Diagnostics (Trouble)",
        },
        {
            "<leader>cd",
            "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
            desc = "Buffer Diagnostics (Trouble)",
        },
        {
            "<leader>cs",
            "<cmd>Trouble symbols toggle focus=false<cr>",
            desc = "Symbols (Trouble)",
        },
        {
            "gr",
            "<cmd>Trouble lsp_references pinned=true focus=true<cr>",
            desc = "LSP references (Trouble)",
        },
        {
            "gi",
            "<cmd>Trouble lsp_implementations toggle<cr>",
            desc = "LSP implementations (Trouble)",
        },
        {
            "<leader>xL",
            "<cmd>Trouble loclist toggle<cr>",
            desc = "Location List (Trouble)",
        },
        {
            "<leader>xQ",
            "<cmd>Trouble qflist toggle<cr>",
            desc = "Quickfix List (Trouble)",
        },
    },
}
