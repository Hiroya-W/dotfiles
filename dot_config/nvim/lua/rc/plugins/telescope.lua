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
        command_palette = require("rc/plugins/telescope-command-palette"),
    },
})
