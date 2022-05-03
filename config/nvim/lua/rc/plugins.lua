-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- packer-custom-initialization
-- This approach has the benefit of not requiring that the `packer` plugin be loaded unless you want to
-- perform plugin management operations, but it is more involved to use.
vim.cmd[[command! -nargs=* -complete=customlist,v:lua.require'packer'.plugin_complete  PackerInstall lua require('packer').install(<f-args>)]]
vim.cmd[[command! -nargs=* -complete=customlist,v:lua.require'packer'.plugin_complete PackerUpdate lua require('packer').update(<f-args>)]]
vim.cmd[[command! -nargs=* -complete=customlist,v:lua.require'packer'.plugin_complete PackerSync lua require('packer').sync(<f-args>)]]
vim.cmd[[command! PackerClean packadd packer.nvim | lua require('plugins').clean()]]
vim.cmd[[command! PackerCompile packadd packer.nvim | lua require('plugins').compile('~/.config/nvim/plugin/packer_load.vim')]]
vim.cmd[[command! -bang -nargs=+ -complete=customlist,v:lua.require'packer'.loader_complete PackerLoad lua require('packer').loader(<f-args>, '<bang>')]]

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
    use {'wbthomason/packer.nvim', opt = true}
    -- Library
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"
    use "kyazdani42/nvim-web-devicons"
    use {
        "rcarriga/nvim-notify", 
        event = "VimEnter"
    }
    --------------------------------------------------------------
    -- Colorscheme
    local colorscheme = "tokyonight.nvim"
    use {
        'folke/tokyonight.nvim',
        config = function()
            vim.g.tokyonight_style = "night"
            vim.cmd[[colorscheme tokyonight]]
        end,
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
    use {"hrsh7th/cmp-buffer", after = {"nvim-cmp"}}
    use {"hrsh7th/cmp-path", after = {"nvim-cmp"}}
    use {'saadparwaiz1/cmp_luasnip', after = {"nvim-cmp"}}
    use {
        "onsails/lspkind-nvim",
        config = function()
            require("rc/plugins/lspkind-nvim")
        end,
    }
    --------------------------------------------------------------
    -- Snippets
    use "L3MON4D3/LuaSnip"
    use "rafamadriz/friendly-snippets"
    --------------------------------------------------------------
    -- LSP
    use {
        "williamboman/nvim-lsp-installer",
        {
            "neovim/nvim-lspconfig",
            --  This is because load order of plugins is not guaranteed, 
            --  leading to nvim-lsp-installer's config function potentially executing after lspconfig's.
            --  See, https://github.com/williamboman/nvim-lsp-installer#setup
            config = function()
                require("rc/lsp")
            end
        }
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)

