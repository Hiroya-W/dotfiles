return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        dashboard = {
            enabled = true,
            width = 80,
            sections = {
                {
                    icon = "",
                    title = "yuyufetch",
                    section = "terminal",
                    cmd = "yuyufetch",
                    height = 18,
                    padding = 2,
                },
                { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
                { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
                { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
                { section = "startup" },
            },
        },
        picker = {
            enabled = true,
            sources = {
                files = {
                    hidden = true,
                    cmd = "fd",
                },
                grep = {
                    hidden = true,
                    cmd = "rg",
                    regex = true,
                },
            },
        },
    },
    keys = {
        {
            "<leader>tf",
            function()
                Snacks.picker.smart()
            end,
            desc = "Smart Find Files",
        },
        {
            "<leader>tg",
            function()
                Snacks.picker.grep()
            end,
            desc = "Grep",
        },
        {
            "<leader>bb",
            function()
                Snacks.picker.buffers({
                    win = {
                        list = {
                            keys = { ["dd"] = "bufdelete" },
                        },
                    },
                })
            end,
            desc = "Buffers",
        },
    },
}
