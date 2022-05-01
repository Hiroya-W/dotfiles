-- F3で相対、絶対表示の切り替え
vim.keymap.set("n", "<F3>", ":<C-u>setlocal relativenumber!<CR>")
-- ESCキー2度押しでハイライトの切り替え
vim.keymap.set("n", "<Esc><Esc>", ":<C-u>set nohlsearch!<CR>", {silent = true})

-- 保存とノーマルモード切り替え
vim.keymap.set("i", "jj", "<ESC>:<C-u>w<CR>", {silent = true})
vim.keymap.set("i", "hh", "<ESC>:<C-u>w<CR>", {silent = true})
vim.keymap.set("i", "kk", "<ESC>:<C-u>w<CR>", {silent = true})

-- ウィンドウ移動
vim.keymap.set("n", "<C-h>", "<C-w>h>")
vim.keymap.set("n", "<C-j>", "<C-w>j>")
vim.keymap.set("n", "<C-k>", "<C-w>k>")
vim.keymap.set("n", "<C-l>", "<C-w>l>")

vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "<down>", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "<up>", "gk")
