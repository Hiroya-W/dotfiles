return {
    -- Show current cursor position
    "gen740/SmoothCursor.nvim",
    event = "VimEnter",
    opts = {
        fancy = {
            enable = true,
        },
        disable_float_win = true,
        disabled_filetypes = {},
    },
}
