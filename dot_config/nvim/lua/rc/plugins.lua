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
    }
})
