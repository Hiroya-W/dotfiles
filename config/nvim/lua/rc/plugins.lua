-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end

-- packer-custom-initialization
-- This approach has the benefit of not requiring that the `packer` plugin be loaded unless you want to
-- perform plugin management operations, but it is more involved to use.
vim.cmd [[command! -nargs=* -complete=customlist,v:lua.require'packer'.plugin_complete  PackerInstall lua require('packer').install(<f-args>)]]
vim.cmd [[command! -nargs=* -complete=customlist,v:lua.require'packer'.plugin_complete PackerUpdate lua require('packer').update(<f-args>)]]
vim.cmd [[command! -nargs=* -complete=customlist,v:lua.require'packer'.plugin_complete PackerSync lua require('packer').sync(<f-args>)]]
vim.cmd [[command! PackerClean packadd packer.nvim | lua require('plugins').clean()]]
vim.cmd [[command! PackerCompile packadd packer.nvim | lua require('plugins').compile('~/.config/nvim/plugin/packer_load.vim')]]
vim.cmd [[command! -bang -nargs=+ -complete=customlist,v:lua.require'packer'.loader_complete PackerLoad lua require('packer').loader(<f-args>, '<bang>')]]

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

require("packer").startup(function()
    -- Packer can manage itself as an optional plugin
    use { 'wbthomason/packer.nvim', opt = true }
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
        event = "VimEnter"
    }
    use {
        "junegunn/fzf",
        run = function ()
            vim.fn["fzf#install"]()
        end
    }
    --------------------------------------------------------------
    -- Appearance
    local colorscheme = "tokyonight.nvim" -- Colorscheme
    use {
        'folke/tokyonight.nvim',
        config = function()
            vim.g.tokyonight_style = "night"
            vim.cmd [[colorscheme tokyonight]]
        end,
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
        "chentau/marks.nvim", -- Show vim mark
        config = function()
            require("rc/plugins/marks")
        end
    }
    use {
        "SmiteshP/nvim-gps", -- Show scope you are working inside
        requires = "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-gps").setup()
        end
    }
    --------------------------------------------------------------
    -- Statusline / Bufferline
    use {
        "nvim-lualine/lualine.nvim",
        after = colorscheme,
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
        config = function()
            require("rc/plugins/lualine")
        end,
    }

    use {
        "akinsho/bufferline.nvim",
        after = colorscheme,
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
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
    --------------------------------------------------------------
    -- Snippets
    use "L3MON4D3/LuaSnip"
    use "rafamadriz/friendly-snippets"
    --------------------------------------------------------------
    -- LSP
    use {
        "neovim/nvim-lspconfig",
        requires = {
            "williamboman/nvim-lsp-installer",
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
        config = function ()
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
    use "folke/lsp-colors.nvim" -- Automatically creates missing LSP highlights groups
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
    use({ "yioneko/nvim-yati", after = "nvim-treesitter" }) -- indent
    use({ "p00f/nvim-ts-rainbow", after = { "nvim-treesitter" } }) -- rainbow parantheses
    --------------------------------------------------------------
    -- Git
    use {
        'lewis6991/gitsigns.nvim',
        tag = 'release',
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
        cyrequiresrequires = {
            "kyazdani42/nvim-web-devicons"
        },
        config = function ()
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
    --------------------------------------------------------------
    -- Search
    use {
        "haya14busa/vim-asterisk",
        config = function()
            require("rc/plugins/vim-asterisk")
        end
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require('packer').sync()
    end
end)
