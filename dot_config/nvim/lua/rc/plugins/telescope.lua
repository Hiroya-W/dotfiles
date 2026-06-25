return {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
        "folke/noice.nvim",
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-frecency.nvim",
            dependencies = { "tami5/sqlite.lua" },
            config = function()
                require("telescope").load_extension("frecency")
            end,
        },
        {
            "AckslD/nvim-neoclip.lua", -- Clipboard manager
            dependencies = { "tami5/sqlite.lua" },
            config = function()
                require("neoclip").setup()
                require("telescope").load_extension("neoclip")
            end,
        },
        {
            "danielfalk/smart-open.nvim",
            branch = "0.2.x",
            config = function()
                require("telescope").load_extension("smart_open")
            end,
            dependencies = {
                "kkharji/sqlite.lua",
                -- Only required if using match_algorithm fzf
                { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
                -- Optional.  If installed, native fzy will be used when match_algorithm is fzy
                { "nvim-telescope/telescope-fzy-native.nvim" },
            },
        },
    },
    config = function()
        local actions = require("telescope.actions")

        require("telescope").setup({
            defaults = {
                -- default mappings
                -- https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/mappings.lua
                mappings = {
                    i = {
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                    },
                    n = {
                        ["<C-c>"] = actions.close,
                    },
                },
            },
            pickers = {
                -- Default configuration for builtin pickers goes here:
                -- picker_name = {
                --   picker_config_key = value,
                --   ...
                -- }
                -- Now the picker_config_key will be applied every time you call this
                -- builtin picker
            },
            extensions = {
                -- https://github.com/nvim-telescope/telescope-frecency.nvim
                frecency = {
                    ignore_patterns = { "*.git/*", "*/tmp/*" },
                },
            },
        })

        require("telescope").load_extension("noice")
        -- require("telescope").load_extension("remote-sshfs")
    end,
}
