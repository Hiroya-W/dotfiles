return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        {
            -- Using SymbolInformatin support
            "SmiteshP/nvim-navic", -- Show scope you are working inside
            -- dependencies = {
            --     "neovim/nvim-lspconfig",
            -- },
            -- config = function()
            --     vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
            -- end
        },
    },
    opts = function()
        local navic = require("nvim-navic")

        return {
            options = {
                icons_enabled = true,
                theme = "auto",
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
                disabled_filetypes = {
                    "NvimTree",
                },
                always_divide_middle = true,
                globalstatus = false,
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = {
                    "filename",
                    { navic.get_location, cond = navic.is_available },
                },
                lualine_x = { "encoding", "fileformat", "filetype" },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
            extensions = {},
        }
    end,
}
