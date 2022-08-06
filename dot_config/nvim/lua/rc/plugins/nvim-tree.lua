--
require 'nvim-tree'.setup {
    disable_netrw = true,
    hijack_netrw = true,
    update_cwd = true,
    view = {
        mappings = {
            custom_only = false,
            list = {
                { key = "v", action = "vsplit" }
            },
        },
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    filters = {
        dotfiles = false,
        -- custom = { "^\\.git" },
        exclude = {},
    },
}

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })

-- https://github.com/kyazdani42/nvim-tree.lua#tips--reminders
-- The auto_close option has been removed because it causes bugs.
-- Now, you can automatically close the tab/vim when nvim-tree is the last window in the tab using following autocmd.
-- WARNING: other plugins or automation may interfere with this:
-- vim.cmd([[
--     augroup nvim_tree_config
--         autocmd!
--         autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
--     augroup end
-- ]])
