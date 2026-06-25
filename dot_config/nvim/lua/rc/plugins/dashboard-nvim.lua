return {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = {
        project = {
            action = function()
                require("telescope").extensions.smart_open.smart_open()
            end,
        },
    },
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
