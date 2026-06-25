return {
    "jay-babu/mason-null-ls.nvim", -- non LSP manager
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "williamboman/mason.nvim",
        "nvimtools/none-ls.nvim", -- Use non LSP sources
        "nvimtools/none-ls-extras.nvim", -- Extra sources
        "lukas-reineke/lsp-format.nvim", -- format on save
        "gbprod/none-ls-ecs.nvim", -- PHP formatter source
    },
    config = function()
        require("rc/lsp/null-ls")
    end,
}
