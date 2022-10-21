-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
        install_path })
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

return require("packer").startup(function()
    use { 'wbthomason/packer.nvim' }
    -- Improve startup time for neovim
    use {
        "lewis6991/impatient.nvim",
        config = function()
            local impatient = require("impatient")
            impatient.enable_profile()
        end
    }
    -- Library
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"
    use {
        "rcarriga/nvim-notify",
        config = function()
            vim.notify = require("notify")
        end
    }
    use {
        "junegunn/fzf",
        run = function()
            vim.fn["fzf#install"]()
        end
    }
    --------------------------------------------------------------
    -- Appearance
    -- local colorscheme = "tokyonight.nvim" -- Colorscheme
    -- use {
    --     'folke/tokyonight.nvim',
    --     config = function()
    --         vim.g.tokyonight_style = "night"
    --         vim.g.tokyonight_italic_comments = false
    --         vim.g.tokyonight_italic_keywords = false
    --         vim.cmd [[colorscheme tokyonight]]
    --     end,
    -- }
    -- local colorscheme = "sequoia-moonlight.nvim" -- Colorscheme
    -- use {
    --     -- "~/Repositories/github.com/Hiroya-W/sequoia-moonlight.nvim",
    --     "Hiroya-W/sequoia-moonlight.nvim",
    --     config = function()
    --         vim.cmd [[colorscheme sequoia]]
    --     end
    -- }
    local colorscheme = "neovim-ayu" -- Colorscheme
    use {
        "Shatur/neovim-ayu",
        config = function ()
            local colors = require('ayu.colors')
            require("ayu").setup({
                overrides = {
                    Comment = { fg = colors.comment },
                    LspSignatureActiveParameter = { italic = false }
                }
            })
            vim.cmd [[colorscheme ayu-light]]
            vim.g.terminal_color_0 = "#000000"
            vim.g.terminal_color_8 = "#323232"

            -- red
            vim.g.terminal_color_1 = "#ff3333"
            vim.g.terminal_color_9 = "#ff6565"

            -- green
            vim.g.terminal_color_2 = "#86b300"
            vim.g.terminal_color_10 = "#b8e532"

            -- yellow
            vim.g.terminal_color_3 = "#f29718"
            vim.g.terminal_color_11 = "#ffc94a"

            -- blue
            vim.g.terminal_color_4 = "#41a6d9"
            vim.g.terminal_color_12 = "#73d8ff"

            -- magenta
            vim.g.terminal_color_5 = "#f07178"
            vim.g.terminal_color_13 = "#ffa3aa"

            -- cyan
            vim.g.terminal_color_6 = "#4dbf99"
            vim.g.terminal_color_14 = "#7ff1cb"

            vim.g.terminal_color_7 = "#ffffff"
            vim.g.terminal_color_15 = "#ffffff"
        end
    }
    use {
        "lukas-reineke/indent-blankline.nvim", -- Indent guides
        config = function()
            require("indent_blankline").setup {
                space_char_blankline = " ",
                show_current_context = true,
                show_current_context_start = true,
            }
        end
    }
    use {
        'mvllow/modes.nvim', -- Change line color in current mode
        config = function()
            require("rc/plugins/modes")
        end
    }
    use {
        "folke/todo-comments.nvim", -- Highlight for todo comments
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup()
        end
    }
    use {
        "norcalli/nvim-colorizer.lua", -- Color highlighter, such as #FFF
        config = function()
            require("colorizer").setup()
        end
    }
    use {
        "chentoast/marks.nvim", -- Show vim mark
        config = function()
            require("rc/plugins/marks")
        end
    }
    use {
        -- Using SymbolInformatin support
        "SmiteshP/nvim-navic", -- Show scope you are working inside
        requires = {
            "neovim/nvim-lspconfig",
        },
    }
    --------------------------------------------------------------
    -- Statusline / Bufferline
    use {
        "nvim-lualine/lualine.nvim",
        after = colorscheme,
        requires = { "kyazdani42/nvim-web-devicons" },
        config = function()
            require("rc/plugins/lualine")
        end,
    }

    use {
        "akinsho/bufferline.nvim",
        after = colorscheme,
        requires = { "kyazdani42/nvim-web-devicons" },
        config = function()
            require("rc/plugins/bufferline")
        end,
    }
    --------------------------------------------------------------
    -- Completion
    use "hrsh7th/nvim-cmp"
    use { "hrsh7th/cmp-buffer", after = { "nvim-cmp" } }
    use { "hrsh7th/cmp-path", after = { "nvim-cmp" } }
    use { "hrsh7th/cmp-nvim-lsp", after = { "nvim-cmp" } }
    use { "hrsh7th/cmp-nvim-lua", after = { "nvim-cmp" } }
    use { 'saadparwaiz1/cmp_luasnip', after = { "nvim-cmp" } }
    use {
        "ray-x/lsp_signature.nvim", -- Show signature on float window automatically
        after = { "nvim-cmp" },
        config = function()
            require("lsp_signature").setup()
        end
    }
    use {
        "onsails/lspkind-nvim", -- to show lsp icons
        config = function()
            require("rc/plugins/lspkind-nvim")
        end,
    }
    use {
        "windwp/nvim-autopairs",
        config = function()
            require("rc/plugins/nvim-autopairs")
        end,
        after = { "nvim-cmp" }
    }
    use {
        "github/copilot.vim",
        -- Need to install manually
        -- run = ":Copilot"
    }
    use {
        "zbirenbaum/copilot.lua",
        requires = {
            "github/copilot.vim"
        },
        event = "VimEnter",
        config = function()
            vim.defer_fn(
                function()
                    require("copilot").setup()
                end,
                100
            )
        end
    }
    use {
        "zbirenbaum/copilot-cmp",
        after = {
            "copilot.lua",
            "nvim-cmp"
        }
    }
    --------------------------------------------------------------
    -- Snippets
    use "L3MON4D3/LuaSnip"
    use "rafamadriz/friendly-snippets"
    --------------------------------------------------------------
    -- LSP
    use {
        "neovim/nvim-lspconfig",
        requires = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "aznhe21/actions-preview.nvim"
        },
        after = { "cmp-nvim-lsp" },
        config = function()
            require("rc/lsp")
        end
    }
    use {
        "tami5/lspsaga.nvim", -- add UI for LSP
        --branch = "nvim6.0",
        requires = {
            "neovim/nvim-lspconfig"
        },
        config = function()
            require("rc/plugins/lspsaga")
        end
    }
    use {
        "j-hui/fidget.nvim", -- UI for nvim-lsp progress
        config = function()
            require("fidget").setup()
        end
    }
    use {
        "jose-elias-alvarez/null-ls.nvim", -- Use non LSP sources, such as flake8, black
        config = function()
            require("rc/lsp/null-ls")
        end,
        requires = { "nvim-lua/plenary.nvim" },
    }
    use {
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        config = function()
            local lsp_lines = require("lsp_lines")
            vim.keymap.set("", "<Leader>l", lsp_lines.toggle, { desc = "Toggle lsp_lines" })
            lsp_lines.setup()
        end,
    }
    use "folke/lsp-colors.nvim" -- Automatically creates missing LSP highlights groups
    use "simrat39/rust-tools.nvim"

    --------------------------------------------------------------
    -- Telescope
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            "nvim-lua/plenary.nvim"
        },
        config = function()
            require("rc/plugins/telescope")
        end
    }
    use {
        "nvim-telescope/telescope-frecency.nvim",
        requires = { "tami5/sqlite.lua" },
        config = function()
            require "telescope".load_extension("frecency")
        end,
    }
    use {
        "AckslD/nvim-neoclip.lua", -- Clipboard manager
        requires = {
            "nvim-telescope/telescope.nvim",
            "tami5/sqlite.lua"
        },
        config = function()
            require('neoclip').setup()
            require("telescope").load_extension("neoclip")
        end,
    }
    use {
        "Hiroya-W/telescope-command-palette.nvim",
        requires = {
            "nvim-telescope/telescope.nvim",
        },
        config = function()
            require("telescope").load_extension("command_palette")
        end
    }
    --------------------------------------------------------------
    -- File explorer
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons',
        },
        config = function()
            require("rc/plugins/nvim-tree")
        end
    }
    --------------------------------------------------------------
    -- Treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require("rc/plugins/nvim-treesitter")
        end,
    })
    use { "nvim-treesitter/playground" }
    use({ "yioneko/nvim-yati", after = "nvim-treesitter" }) -- indent
    use({ "p00f/nvim-ts-rainbow", after = { "nvim-treesitter" } }) -- rainbow parantheses
    use { "qnighy/satysfi.vim" } -- for satysfi syntax-highlight
    --------------------------------------------------------------
    -- Git
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require("gitsigns").setup()
        end
    }
    use {
        "kdheepak/lazygit.nvim",
        config = function()
            vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { silent = true })
        end
    }
    use {
        "rhysd/committia.vim", -- Show status, diff windows when git commit
        config = function()
            require("rc/plugins/committia")
        end
    }
    use {
        'akinsho/git-conflict.nvim',
        config = function()
            require('git-conflict').setup()
        end
    }
    -- GitHub
    use {
        'pwntester/octo.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim',
            'kyazdani42/nvim-web-devicons',
        },
        -- 622ab9feaa735dc0999e567183ce357f3dff080f is broken
        -- Detect owner/repository is incorrect
        commit = "43185282331a768417c3dc7a6a1ac7c3f09c28f9",
        config = function()
            require("octo").setup()
        end
    }
    --------------------------------------------------------------
    -- UI
    use {
        "akinsho/toggleterm.nvim",
        config = function()
            require("rc/plugins/toggleterm")
        end
    }
    use {
        'numToStr/Comment.nvim', -- toggle comment
        config = function()
            require('Comment').setup()
        end
    }
    use {
        "folke/trouble.nvim", -- UI for diagnostics, references,...
        requires = {
            "kyazdani42/nvim-web-devicons"
        },
        config = function()
            require("trouble").setup()
        end
    }
    use {
        "kevinhwang91/nvim-bqf", -- show quickfix preview on float window
        requires = {
            "junegunn/fzf",
            "nvim-treesitter/nvim-treesitter"
        },
    }
    use {
        'phaazon/hop.nvim',
        branch = 'v1', -- optional but strongly recommended
        config = function()
            require("rc/plugins/hop")
        end
    }
    use "tpope/vim-surround"
    use {
        "matbme/JABS.nvim", --  Buffer Switcher
        config = function()
            require("rc/plugins/JABS")
        end
    }
    use {
        "folke/which-key.nvim",
        config = function()
            require("rc/plugins/which-key")
        end
    }
    use {
        "kwkarlwang/bufresize.nvim",
        config = function()
            require("bufresize").setup()
        end
    }
    use {
        "petertriho/nvim-scrollbar",
        requires = {
            "kevinhwang91/nvim-hlslens"
        },
        config = function()
            require("rc/plugins/nvim-scrollbar")
        end
    }
    use {
        -- Show current cursor position
        "gen740/SmoothCursor.nvim",
        config = function()
            require('smoothcursor').setup({
                fancy = {
                    enable = true
                }
            })
        end
    }
    use({
        "folke/noice.nvim",
        event = "VimEnter",
        config = function()
            require("noice").setup()
        end,
        requires = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        }
    })
    --------------------------------------------------------------
    -- Search
    use {
        "haya14busa/vim-asterisk",
        config = function()
            require("rc/plugins/vim-asterisk")
        end
    }
    --------------------------------------------------------------
    -- Debugger
    use {
        "mfussenegger/nvim-dap",
        config = function()
            require("rc/dap")
        end,
    }
    use {
        "rcarriga/nvim-dap-ui",
        requires = { "mfussenegger/nvim-dap" },
    }
    use {
        "theHamsta/nvim-dap-virtual-text",
        requires = {
            "mfussenegger/nvim-dap",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("nvim-dap-virtual-text").setup()
        end
    }
    use {
        "jbyuki/one-small-step-for-vimkind",
        requires = {
            "mfussenegger/nvim-dap"
        }
    }
    use {
        "leoluz/nvim-dap-go",
        config = function()
            require("dap-go").setup()
        end
    }
    --------------------------------------------------------------
    -- Markdown previewer
    use {
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    }
    --------------------------------------------------------------
    -- For Japanese plugin
    use "deton/jasegment.vim"
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require('packer').sync()
    end
end)
