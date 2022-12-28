-- F3で相対、絶対表示の切り替え
vim.keymap.set("n", "<F3>", ":<C-u>setlocal relativenumber!<CR>")
-- ESCキー2度押しでハイライトの切り替え
vim.keymap.set("n", "<Esc><Esc>", ":<C-u>set nohlsearch!<CR>", { silent = true })

-- 保存とノーマルモード切り替え
vim.keymap.set("i", "jj", "<ESC>:<C-u>w<CR>", { silent = true })
vim.keymap.set("i", "hh", "<ESC>:<C-u>w<CR>", { silent = true })
vim.keymap.set("i", "kk", "<ESC>:<C-u>w<CR>", { silent = true })

vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "<down>", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "<up>", "gk")

-- Telescope
vim.keymap.set("n", "<leader>tf", ":Telescope find_files<CR>", {
    noremap = true,
    silent = true,
    desc = "Find files"
})

vim.keymap.set("n", "<leader>tg", ":Telescope live_grep<CR>", {
    noremap = true,
    silent = true,
    desc = "Live grep"
})

-- NvimTree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })

-- LazyGit
vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { silent = true })
