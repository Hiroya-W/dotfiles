vim.g.neovide_cursor_vfx_mode = "railgun"
vim.g.neovide_floating_shadow = false

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

    -- Allow clipboard copy paste in neovim
    -- https://github.com/neovide/neovide/issues/1263#issuecomment-1100895622
    vim.g.neovide_input_use_logo = 1
    vim.keymap.set('', '<D-v>', '+p<CR>', { noremap = true, silent = true })
    vim.keymap.set('!', '<D-v>', '<C-R>+', { noremap = true, silent = true })
    vim.keymap.set('t', '<D-v>', '<C-R>+', { noremap = true, silent = true })
    vim.keymap.set('v', '<D-v>', '<C-R>+', { noremap = true, silent = true })
end
