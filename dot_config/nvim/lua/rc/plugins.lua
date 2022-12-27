local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup({
    --------------------------------------------------------------
    -- Appearance
    -- {
    --     -- "~/Repositories/github.com/Hiroya-W/sequoia-moonlight.nvim",
    --     "Hiroya-W/sequoia-moonlight.nvim",
    --     config = function()
    --         vim.cmd [[colorscheme sequoia]]
    --     end
    -- },
    {
        "Shatur/neovim-ayu",
        config = function ()
            require("rc/plugins/ayu")
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim", -- Indent guides
        config = function()
            require("indent_blankline").setup {
                space_char_blankline = " ",
                show_current_context = true,
                show_current_context_start = true,
            }
        end
    },
    {
        'mvllow/modes.nvim', -- Change line color in current mode
        config = function()
            require("rc/plugins/modes")
        end
    },
    {
        "folke/todo-comments.nvim", -- Highlight for todo comments
        dependencies = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup()
        end
    },
    {
        "norcalli/nvim-colorizer.lua", -- Color highlighter, such as #FFF
        config = function()
            require("colorizer").setup()
        end
    },
    {
        "chentoast/marks.nvim", -- Show vim mark
        config = function()
            require("rc/plugins/marks")
        end
    },
    {
        -- Using SymbolInformatin support
        "SmiteshP/nvim-navic", -- Show scope you are working inside
        dependencies = {
            "neovim/nvim-lspconfig",
        },
    },
    --------------------------------------------------------------
    -- Statusline / Bufferline
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "kyazdani42/nvim-web-devicons",
            "SmiteshP/nvim-navic"
        },
        config = function()
            require("rc/plugins/lualine")
        end,
    },
    {
        "akinsho/bufferline.nvim",
        dependencies = { "kyazdani42/nvim-web-devicons" },
        config = function()
            require("bufferline").setup()
        end,
    },
    --------------------------------------------------------------
    -- Completion
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "saadparwaiz1/cmp_luasnip",
            "zbirenbaum/copilot-cmp",
        }
    },
    {
        "ray-x/lsp_signature.nvim", -- Show signature on float window automatically
        dependencies = { "hrsh7th/nvim-cmp" },
        config = function()
            require("lsp_signature").setup()
        end
    },
    {
        "onsails/lspkind-nvim", -- to show lsp icons
        config = function()
            require("rc/plugins/lspkind-nvim")
        end,
    },
    {
        "windwp/nvim-autopairs",
        config = function()
            require("rc/plugins/nvim-autopairs")
        end,
        dependencies = { "hrsh7th/nvim-cmp" }
    },
    {
        "github/copilot.vim"
        -- Need to install manually
        -- run = ":Copilot"
    },
    {
        "zbirenbaum/copilot-cmp",
        dependencies = "zbirenbaum/copilot.lua",
    },
    --------------------------------------------------------------
    -- Snippets
    { "L3MON4D3/LuaSnip" },
    {"rafamadriz/friendly-snippets" },
    --------------------------------------------------------------
    -- LSP
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "aznhe21/actions-preview.nvim"
        },
        -- after = { "cmp-nvim-lsp" },
        config = function()
            require("rc/lsp")
        end
    },
    {
        "tami5/lspsaga.nvim", -- add UI for LSP
        --branch = "nvim6.0",
        dependencies = {
            "neovim/nvim-lspconfig"
        },
        config = function()
            require("rc/plugins/lspsaga")
        end
    },
    {
        "j-hui/fidget.nvim", -- UI for nvim-lsp progress
        config = function()
            require("fidget").setup()
        end
    },
    {
        "jose-elias-alvarez/null-ls.nvim", -- Use non LSP sources, such as flake8, black
        config = function()
            require("rc/lsp/null-ls")
        end,
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        "Maan2003/lsp_lines.nvim",
        config = function()
            local lsp_lines = require("lsp_lines")
            vim.keymap.set("", "<Leader>l", lsp_lines.toggle, { desc = "Toggle lsp_lines" })
            lsp_lines.setup()
        end,
    },
    { "folke/lsp-colors.nvim" }, -- Automatically creates missing LSP highlights groups
    { "simrat39/rust-tools.nvim" },
    --------------------------------------------------------------
    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        config = function()
            require("rc/plugins/telescope")
        end
    },
    {
        "nvim-telescope/telescope-frecency.nvim",
        dependencies = { "tami5/sqlite.lua" },
        config = function()
            require "telescope".load_extension("frecency")
        end,
    },
    {
        "AckslD/nvim-neoclip.lua", -- Clipboard manager
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "tami5/sqlite.lua"
        },
        config = function()
            require('neoclip').setup()
            require("telescope").load_extension("neoclip")
        end,
    },
    {
        "Hiroya-W/telescope-command-palette.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
        },
        config = function()
            require("telescope").load_extension("command_palette")
        end
    },
    --------------------------------------------------------------
    -- File explorer
    {
        "kyazdani42/nvim-tree.lua",
        dependencies = {
            'kyazdani42/nvim-web-devicons',
        },
        config = function()
            require("rc/plugins/nvim-tree")
        end
    },
    --------------------------------------------------------------
    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
        config = function()
            require("rc/plugins/nvim-treesitter")
        end,
    },
    { "nvim-treesitter/playground" },
    { "yioneko/nvim-yati", dependencies = "nvim-treesitter" }, -- indent
    { "p00f/nvim-ts-rainbow", dependencies = { "nvim-treesitter" } }, -- rainbow parantheses
    { "qnighy/satysfi.vim" }, -- for satysfi syntax-highlight
})
