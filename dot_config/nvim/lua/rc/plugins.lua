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
    {
        "vim-denops/denops.vim",
        dependencies = {
            {
                "vim-skk/skkeleton",
                config = function()
                    vim.fn["skkeleton#config"]({
                        globalDictionaries = {
                            "~/.local/share/skk/SKK-JISYO.L"
                        }
                    })
                end
            },
            {
                "delphinus/skkeleton_indicator.nvim",
                config = function()
                    require("skkeleton_indicator").setup()
                end
            }
        }
    },
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true
    },
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
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim", -- Indent guides
        main = "ibl",
        event = "VimEnter",
        config = function()
            require("rc/plugins/indent-blankline")
        end,
    },
    {
        "mvllow/modes.nvim", -- Change line color in current mode
        event = "ModeChanged",
        config = function()
            require("rc/plugins/modes")
        end,
    },
    {
        "folke/todo-comments.nvim", -- Highlight for todo comments
        event = "VimEnter",
        dependencies = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup()
        end,
    },
    {
        "norcalli/nvim-colorizer.lua", -- Color highlighter, such as #FFF
        event = "VimEnter",
        config = function()
            require("colorizer").setup()
        end,
    },
    {
        "chentoast/marks.nvim", -- Show vim mark
        config = function()
            require("rc/plugins/marks")
        end,
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        config = function()
            require("rc/plugins/noice")
        end,
    },
    {
        "nvimdev/dashboard-nvim",
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
                -- config
            }
        end,
        dependencies = { { "nvim-tree/nvim-web-devicons" } }
    },
    --------------------------------------------------------------
    -- Statusline / Bufferline
    {
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
        config = function()
            require("rc/plugins/lualine")
        end,
    },
    {
        "akinsho/bufferline.nvim",
        config = function()
            require("bufferline").setup()
        end,
    },
    -- Breadcrumbs
    {
        'Bekaboo/dropbar.nvim',
        dependencies = {
            'nvim-telescope/telescope-fzf-native.nvim'
        }
    },
    --------------------------------------------------------------
    -- Completion
    {
        "Hiroya-W/nvim-cmp",
        branch = "v0.0.1", -- 最新だとコマンドラインからの補完が壊れてる
        event = "InsertEnter",
        dependencies = {
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },
            { "saadparwaiz1/cmp_luasnip" },
            -- {
            --     -- Need to install manually
            --     -- run = ":Copilot"
            --     "zbirenbaum/copilot-cmp",
            --     dependencies = {
            --         {
            --             "zbirenbaum/copilot.lua",
            --             dependencies = { "github/copilot.vim" },
            --         },
            --     },
            -- },
            -- SKK
            { "rinx/cmp-skkeleton" },
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
        end,
    },
    {
        "ray-x/lsp_signature.nvim", -- Show signature on float window automatically
        event = "InsertEnter",
        dependencies = { "Hiroya-W/nvim-cmp" },
        config = function()
            require("lsp_signature").setup()
        end,
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
            { "pmizio/typescript-tools.nvim" },
        },
        config = function()
            require("rc/lsp")
        end,
    },
    {
        "nvimdev/lspsaga.nvim", -- add UI for LSP
        event = "VimEnter",
        dependencies = {
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("rc/plugins/lspsaga")
        end,
    },
    {
        "j-hui/fidget.nvim", -- UI for nvim-lsp progress
        tag = "legacy",
        event = "VimEnter",
        config = function()
            require("fidget").setup()
        end,
    },
    {
        "jay-babu/mason-null-ls.nvim", -- non LSP manager
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "williamboman/mason.nvim",
            "nvimtools/none-ls.nvim",        -- Use non LSP sources
            "nvimtools/none-ls-extras.nvim", -- Extra sources
            "lukas-reineke/lsp-format.nvim", -- format on save
            "gbprod/none-ls-ecs.nvim", -- PHP formatter source
        },
        config = function()
            require("rc/lsp/null-ls")
        end,
    },
    {
        "Maan2003/lsp_lines.nvim",
        config = function()
            local lsp_lines = require("lsp_lines")
            vim.keymap.set("", "<Leader>l", lsp_lines.toggle, { desc = "Toggle lsp_lines" })
            lsp_lines.setup()
        end,
    },
    -- for editing neovim configs
    {
        "folke/neodev.nvim",
        opts = {}
    },
    {
        "lukas-reineke/lsp-format.nvim",
        lazy = true,
        config = function()
            require("rc/lsp/lsp-format")
        end
    },
    --------------------------------------------------------------
    -- Telescope
    {
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
        },
        config = function()
            require("rc/plugins/telescope")
        end,
    },
    --------------------------------------------------------------
    -- File explorer
    {
        "nvim-tree/nvim-tree.lua",
        cmd = "NvimTreeToggle",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("rc/plugins/nvim-tree")
        end,
    },
    --------------------------------------------------------------
    -- Syntax Highlight
    {
        "nvim-treesitter/nvim-treesitter",
        event = "BufReadPost",
        dependencies = {
            { "yioneko/nvim-yati" }, -- indent
            { "hiphish/rainbow-delimiters.nvim" }
        },
        build = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
        config = function()
            require("rc/plugins/nvim-treesitter")
        end,
    },
    --{
    --    "nvim-treesitter/playground",
    --    cmd = "TSPlaygroundToggle",
    --    dependencies = { "nvim-treesitter/nvim-treesitter" },
    --},
    {
        -- for satysfi syntax-highlight
        "qnighy/satysfi.vim",
        ft = "satysfi",
    },
    --------------------------------------------------------------
    -- Git
    {
        "lewis6991/gitsigns.nvim",
        event = "BufReadPre",
        config = function()
            require("gitsigns").setup()
        end,
    },
    {
        "kdheepak/lazygit.nvim",
        cmd = "LazyGit",
    },
    {
        "rhysd/committia.vim", -- Show status, diff windows when git commit
        event = "BufReadPre",
        config = function()
            require("rc/plugins/committia")
        end,
    },
    {
        "akinsho/git-conflict.nvim",
        version = "v1.3.0",
        event = "BufReadPre",
        config = true
    },
    {
        "FabijanZulj/blame.nvim",
        config = function()
            require("rc/plugins/blame")
        end
    },
    --------------------------------------------------------------
    -- UI
    {
        "akinsho/toggleterm.nvim",
        keys = "<C-t>",
        config = function()
            require("rc/plugins/toggleterm")
        end,
    },
    {
        "numToStr/Comment.nvim", -- toggle comment
        -- keys = { "gc", "gb" },
        config = function()
            require("Comment").setup()
        end,
    },
    {
        "folke/trouble.nvim", -- UI for diagnostics, references,...
        cmd = { "Trouble" },
        dependencies = {
            "kyazdani42/nvim-web-devicons",
        },
        keys = {
            {
                "<leader>cw",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>cd",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "gr",
                "<cmd>Trouble lsp_references pinned=true focus=true<cr>",
                desc = "LSP references (Trouble)",
            },
            {
                "gi",
                "<cmd>Trouble lsp_implementations toggle<cr>",
                desc = "LSP implementations (Trouble)",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
        config = function()
            require("trouble").setup()
        end,
    },
    {
        "kevinhwang91/nvim-bqf", -- show quickfix preview on float window
        dependencies = {
            "junegunn/fzf",
            "nvim-treesitter/nvim-treesitter",
        },
    },
    {
        "phaazon/hop.nvim",
        branch = "v2", -- optional but strongly recommended
        lazy = true,
        config = function()
            require("hop").setup({
                keys = "etovxqpdygfblzhckisuran",
            })
        end,
    },
    { "tpope/vim-surround" },
    {
        "matbme/JABS.nvim", --  Buffer Switcher
        config = function()
            require("rc/plugins/JABS")
        end,
    },
    {
        "folke/which-key.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "echasnovski/mini.icons",
        },
        config = function()
            require("rc/plugins/which-key")
        end,
    },
    {
        "kwkarlwang/bufresize.nvim",
        event = {
            "BufWinEnter",
            "WinEnter",
        },
        config = function()
            require("bufresize").setup()
        end,
    },
    {
        "petertriho/nvim-scrollbar",
        event = {
            "BufWinEnter",
            "CmdwinLeave",
            "TabEnter",
            "TermEnter",
            "TextChanged",
            "VimResized",
            "WinEnter",
            "WinScrolled",
        },
        dependencies = {
            "kevinhwang91/nvim-hlslens",
        },
        config = function()
            require("rc/plugins/nvim-scrollbar")
        end,
    },
    {
        -- Show current cursor position
        "gen740/SmoothCursor.nvim",
        event = "VimEnter",
        config = function()
            require("rc/plugins/smoothcursor")
        end,
    },
    --------------------------------------------------------------
    -- Search
    {
        "haya14busa/vim-asterisk",
        keys = {
            "<Plug>(asterisk-z*)",
            "<Plug>(asterisk-z#)",
            "<Plug>(asterisk-gz*)",
            "<Plug>(asterisk-gz#)",
        },
        config = function()
            vim.g["asterisk#keeppos"] = 1
        end,
    },
    --------------------------------------------------------------
    -- Debugger
    {
        "mfussenegger/nvim-dap",
        lazy = true,
        dependencies = {
            "rcarriga/nvim-dap-ui",
            {
                "theHamsta/nvim-dap-virtual-text",
                dependencies = {
                    "nvim-treesitter/nvim-treesitter",
                },
                config = function()
                    require("nvim-dap-virtual-text").setup()
                end,
            },
            { "jbyuki/one-small-step-for-vimkind" },
        },
        config = function()
            require("rc/dap")
        end,
    },
    {
        "leoluz/nvim-dap-go",
        ft = "go",
        config = function()
            require("dap-go").setup()
        end,
    },
    --------------------------------------------------------------
    -- Markdown Previewer
    {
        "toppair/peek.nvim",
        event = { "VeryLazy" },
        build = "deno task --quiet build:fast",
        config = function()
            require("peek").setup()
            vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
            vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
        end,
    },
    --------------------------------------------------------------
    -- For Japanese plugin
    { "deton/jasegment.vim" },
    --------------------------------------------------------------
    -- rsync plugins
    {
        "coffebar/transfer.nvim",
        lazy = true,
        cmd = { "TransferInit", "DiffRemote", "TransferUpload", "TransferDownload", "TransferDirDiff", "TransferRepeat" },
        opts = {},
    },
    -- Remote SSH
    -- {
    --     "amitds1997/remote-nvim.nvim",
    --     version = "v0.2.6",
    --     dependencies = {
    --         "nvim-lua/plenary.nvim",         -- For standard functions
    --         "MunifTanjim/nui.nvim",          -- To build the plugin UI
    --         "nvim-telescope/telescope.nvim", -- For picking b/w different remote methods
    --     },
    --     config = function()
    --         require("remote-nvim").setup({
    --             -- Add your other configuration parameters as usual
    --             offline_mode = {
    --                 enabled = true,
    --                 no_github = true,
    --                 -- Add this only if you want to change the path where the Neovim releases are downloaded/located.
    --                 -- Default location is the output of :lua= vim.fn.stdpath("cache") .. "/remote-nvim.nvim/version_cache"
    --                 -- cache_dir = <custom-path>,
    --             },
    --         })
    --     end
    -- },
    -- {
    --     "nosduco/remote-sshfs.nvim",
    --     dependencies = {
    --         "nvim-telescope/telescope.nvim"
    --     },
    --     config = function()
    --         require("remote-sshfs").setup({});
    --     end
    -- },
    -- {
    --     "chipsenkbeil/distant.nvim",
    --     branch = 'v0.3',
    --     config = function()
    --         require('distant'):setup()
    --     end
    -- }
})
