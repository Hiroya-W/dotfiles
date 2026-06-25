require("scrollbar").setup({
    excluded_buftypes = {
        "JABSwindow",
    },
    excluded_filetypes = {
        "dashboard"
    }
})
require("scrollbar.handlers.search").setup()
