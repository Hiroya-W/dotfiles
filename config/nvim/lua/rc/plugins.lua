vim.cmd[[packadd packer.nvim]]

require("packer").startup(function()
    -- Library
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"
    use "kyazdani42/nvim-web-devicons"
    use {
        "rcarriga/nvim-notify", 
        event = "VimEnter"
    }

    -- Colorscheme
    use {
        'folke/tokyonight.nvim',
        config = function()
            vim.g.tokyonight_style = "night"
            vim.cmd[[colorscheme tokyonight]]
        end,
    }
end)

