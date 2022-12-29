local colors = require("ayu.colors")
require("ayu").setup({
    overrides = {
        Comment = { fg = colors.comment },
        LspSignatureActiveParameter = { italic = false },
    },
})
vim.cmd([[colorscheme ayu-light]])
vim.g.terminal_color_0 = "#000000"
vim.g.terminal_color_8 = "#323232"

-- red
vim.g.terminal_color_1 = "#ff3333"
vim.g.terminal_color_9 = "#ff6565"

-- green
vim.g.terminal_color_2 = "#86b300"
vim.g.terminal_color_10 = "#b8e532"

-- yellow
vim.g.terminal_color_3 = "#f29718"
vim.g.terminal_color_11 = "#ffc94a"

-- blue
vim.g.terminal_color_4 = "#41a6d9"
vim.g.terminal_color_12 = "#73d8ff"

-- magenta
vim.g.terminal_color_5 = "#f07178"
vim.g.terminal_color_13 = "#ffa3aa"

-- cyan
vim.g.terminal_color_6 = "#4dbf99"
vim.g.terminal_color_14 = "#7ff1cb"

vim.g.terminal_color_7 = "#ffffff"
vim.g.terminal_color_15 = "#ffffff"
