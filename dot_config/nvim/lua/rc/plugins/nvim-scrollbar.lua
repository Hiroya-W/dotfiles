return {
    "petertriho/nvim-scrollbar",
    event = {
        "BufWinEnter",
        "CmdwinLeave",
        "TabEnter",
        "TermEnter",
        "TextChanged",
        "VimResized",
        "WinEnter",
        "WinScrolled",
    },
    dependencies = {
        "kevinhwang91/nvim-hlslens",
    },
    config = function()
        require("scrollbar").setup({
            excluded_buftypes = {
                "JABSwindow",
            },
            excluded_filetypes = {
                "dashboard",
            },
        })
        require("scrollbar.handlers.search").setup()
    end,
}
