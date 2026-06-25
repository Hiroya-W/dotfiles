local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        { import = "rc.plugins.denops" },
        --------------------------------------------------------------
        -- Appearance
        -- { import = "rc.plugins.ayu" },
        { import = "rc.plugins.catppuccin" },
        { import = "rc.plugins.indent-blankline" },
        { import = "rc.plugins.modes" },
        { import = "rc.plugins.todo-comments" },
        { import = "rc.plugins.marks" },
        { import = "rc.plugins.noice" },
        { import = "rc.plugins.dashboard-nvim" },
        --------------------------------------------------------------
        -- Statusline / Bufferline
        { import = "rc.plugins.lualine" },
        { import = "rc.plugins.bufferline" },
        { import = "rc.plugins.dropbar" },
        --------------------------------------------------------------
        -- Completion
        { import = "rc.plugins.lsp_signature" },
        { import = "rc.plugins.cmp" },
        -- cmp dependencies
        { import = "rc.plugins.nvim-autopairs" },
        { import = "rc.plugins.lspkind-nvim" },
        --------------------------------------------------------------
        -- LSP
        { import = "rc.plugins.nvim-lspconfig" },
        { import = "rc.plugins.lspsaga" },
        { import = "rc.plugins.fidget" },
        { import = "rc.plugins.mason-null-ls" },
        { "folke/neodev.nvim" },
        { import = "rc.plugins.lsp-format" },
    },
    checker = { enabled = true },
})
