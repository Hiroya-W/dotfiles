local noice = require("noice")

require("noice").setup({
    cmdline = {
        view = "cmdline"
    },
    views = {
        popupmenu = {
            relative = "editor",
            position = {
                row = "100%",
                col = 0,
            },
            size = {
                width = 60,
                height = 10,
            },
            border = {
                style = "rounded",
                padding = { 0, 1 },
            },
            win_options = {
                winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
            },
        },
    },
})
