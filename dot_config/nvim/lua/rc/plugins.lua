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
        config = function()
            require("rc/plugins/ayu")
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim", -- Indent guides
        event = "VimEnter",
        config = function()
            require("indent_blankline").setup {
                space_char_blankline = " ",
                show_current_context = true,
                show_current_context_start = true,
            }
        end
    },
    {
        "mvllow/modes.nvim", -- Change line color in current mode
        event = "ModeChanged",
        config = function()
            require("rc/plugins/modes")
        end
    },
    {
        "folke/todo-comments.nvim", -- Highlight for todo comments
        event = "VimEnter",
        dependencies = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup()
        end
    },
    {
        "norcalli/nvim-colorizer.lua", -- Color highlighter, such as #FFF
        event = "VimEnter",
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
    --------------------------------------------------------------
    -- Statusline / Bufferline
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "kyazdani42/nvim-web-devicons",
            {
                -- Using SymbolInformatin support
                "SmiteshP/nvim-navic", -- Show scope you are working inside
                -- dependencies = {
                --     "neovim/nvim-lspconfig",
                -- },
            },
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
        event = "InsertEnter",
        dependencies = {
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },
            { "saadparwaiz1/cmp_luasnip" },
            {
                -- Need to install manually
                -- run = ":Copilot"
                "zbirenbaum/copilot-cmp",
                dependencies = {
                    {
                        "zbirenbaum/copilot.lua",
                        dependencies = { "github/copilot.vim" }
                    }
                },
            },
            {
                "windwp/nvim-autopairs",
                config = function()
                    require("rc/plugins/nvim-autopairs")
                end,
            },
            {
                "onsails/lspkind-nvim", -- to show lsp icons
                config = function()
                    require("rc/plugins/lspkind-nvim")
                end,
            },
            -- Snippets
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
        },
        config = function()
            require("rc/plugins/cmp")
        end
    },
    {
        "ray-x/lsp_signature.nvim", -- Show signature on float window automatically
        event = "InsertEnter",
        dependencies = { "hrsh7th/nvim-cmp" },
        config = function()
            require("lsp_signature").setup()
        end
    },
    --------------------------------------------------------------
    -- LSP
    {
        "neovim/nvim-lspconfig",
        lazy = true,
        dependencies = {
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },
            { "aznhe21/actions-preview.nvim" },
            { "folke/lsp-colors.nvim" }, -- Automatically creates missing LSP highlights groups
            { "simrat39/rust-tools.nvim" },
        },
        config = function()
            require("rc/lsp")
        end
    },
    {
        "tami5/lspsaga.nvim", -- add UI for LSP
        --branch = "nvim6.0",
        event = "BufReadPre",
        dependencies = {
            "neovim/nvim-lspconfig"
        },
        config = function()
            require("rc/plugins/lspsaga")
        end
    },
    {
        "j-hui/fidget.nvim", -- UI for nvim-lsp progress
        event = "VimEnter",
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
    --------------------------------------------------------------
    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-frecency.nvim",
                dependencies = { "tami5/sqlite.lua" },
            },
            {
                "AckslD/nvim-neoclip.lua", -- Clipboard manager
                dependencies = { "tami5/sqlite.lua" },
            },
        },
        config = function()
            require("rc/plugins/telescope")
            require("telescope").load_extension("frecency")
            require('neoclip').setup()
            require("telescope").load_extension("neoclip")
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
    --------------------------------------------------------------
    -- Git
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end
    },
    {
        "kdheepak/lazygit.nvim",
        config = function()
            vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { silent = true })
        end
    },
    {
        "rhysd/committia.vim", -- Show status, diff windows when git commit
        config = function()
            require("rc/plugins/committia")
        end
    },
    {
        "akinsho/git-conflict.nvim",
        config = function()
            require('git-conflict').setup()
        end
    },
    -- GitHub
    {
        "pwntester/octo.nvim",
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
    },
    --------------------------------------------------------------
    -- UI
    {
        "akinsho/toggleterm.nvim",
        config = function()
            require("rc/plugins/toggleterm")
        end
    },
    {
        "numToStr/Comment.nvim", -- toggle comment
        config = function()
            require('Comment').setup()
        end
    },
    {
        "folke/trouble.nvim", -- UI for diagnostics, references,...
        dependencies = {
            "kyazdani42/nvim-web-devicons"
        },
        config = function()
            require("trouble").setup()
        end
    },
    {
        "kevinhwang91/nvim-bqf", -- show quickfix preview on float window
        dependencies = {
            "junegunn/fzf",
            "nvim-treesitter/nvim-treesitter"
        },
    },
    {
        'phaazon/hop.nvim',
        branch = 'v1', -- optional but strongly recommended
        config = function()
            require("rc/plugins/hop")
        end
    },
    { "tpope/vim-surround" },
    {
        "matbme/JABS.nvim", --  Buffer Switcher
        config = function()
            require("rc/plugins/JABS")
        end
    },
    {
        "folke/which-key.nvim",
        config = function()
            require("rc/plugins/which-key")
        end
    },
    {
        "kwkarlwang/bufresize.nvim",
        config = function()
            require("bufresize").setup()
        end
    },
    {
        "petertriho/nvim-scrollbar",
        dependencies = {
            "kevinhwang91/nvim-hlslens"
        },
        config = function()
            require("rc/plugins/nvim-scrollbar")
        end
    },
    {
        -- Show current cursor position
        "gen740/SmoothCursor.nvim",
        config = function()
            require('smoothcursor').setup({
                fancy = {
                    enable = true
                }
            })
        end
    },
    --------------------------------------------------------------
    -- Search
    {
        "haya14busa/vim-asterisk",
        config = function()
            require("rc/plugins/vim-asterisk")
        end
    },
    --------------------------------------------------------------
    -- Debugger
    {
        "mfussenegger/nvim-dap",
        config = function()
            require("rc/dap")
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap" },
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("nvim-dap-virtual-text").setup()
        end
    },
    {
        "jbyuki/one-small-step-for-vimkind",
        dependencies = {
            "mfussenegger/nvim-dap"
        }
    },
    {
        "leoluz/nvim-dap-go",
        config = function()
            require("dap-go").setup()
        end
    },
    --------------------------------------------------------------
    -- Markdown previewer
    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },
    --------------------------------------------------------------
    -- For Japanese plugin
    { "deton/jasegment.vim" }
})
