return {
    "vim-denops/denops.vim",
    dependencies = {
        {
            "vim-skk/skkeleton",
            config = function()
                vim.fn["skkeleton#config"]({
                    globalDictionaries = {
                        "~/.local/share/skk/SKK-JISYO.L",
                    },
                })
            end,
        },
        {
            "delphinus/skkeleton_indicator.nvim",
            config = function()
                require("skkeleton_indicator").setup()
            end,
        },
    },
}
