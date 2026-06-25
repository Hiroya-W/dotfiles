require("catppuccin").setup({
    -- Neovideのターミナルの色に反映されないのでセットするように
    term_colors = true,
})

vim.cmd([[colorscheme catppuccin-mocha]])
