vim.g.neovide_cursor_vfx_mode = "railgun"

if vim.g.neovide == true then
    vim.keymap.set(
        "n",
        "<C-+>",
        ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>",
        { silent = true }
    )
    vim.keymap.set(
        "n",
        "<C-->",
        ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>",
        { silent = true }
    )
    vim.keymap.set("n", "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>", { silent = true })
end
