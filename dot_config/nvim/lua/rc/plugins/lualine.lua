local navic = require("nvim-navic")

-- https://github.com/nvim-lualine/lualine.nvim/discussions/493
local function get_time()
    return "🕙" .. os.date("%H:%M", os.time())
end

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            "NvimTree"
        },
        always_divide_middle = true,
        globalstatus = false,
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = {
            'filename',
            { navic.get_location, cond = navic.is_available }
        },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress', 'location' },
        lualine_z = { get_time }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {}
}
