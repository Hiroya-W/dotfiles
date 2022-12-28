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

-- hop.nvim
vim.api.nvim_set_keymap('n', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('n', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('o', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
vim.api.nvim_set_keymap('o', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
vim.api.nvim_set_keymap('', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
-- vim.api.nvim_set_keymap('n', '<leader>e', "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END })<cr>", {})
-- vim.api.nvim_set_keymap('v', '<leader>e', "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END })<cr>", {})
-- vim.api.nvim_set_keymap('o', '<leader>e', "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END, inclusive_jump = true })<cr>", {})

-- :HopChar1
vim.api.nvim_set_keymap("n", "<space><space>s", "<cmd>lua require'hop'.hint_char1()<cr>", {})
-- :HopWord
vim.api.nvim_set_keymap("n", "<space><space>w", "<cmd>lua require'hop'.hint_words()<cr>", {})

-- vim-asterisk
-- カーソル下にある単語を検索する
-- *: 順方向検索, #: 逆方向検索
-- 単語区切りでマッチする
-- <fuga>は hogefugahoge のfugaにマッチしない
vim.keymap.set("", "*", "<Plug>(asterisk-z*)")
vim.keymap.set("", "#", "<Plug>(asterisk-z#)")

-- 単語区切りでマッチさせない
vim.keymap.set("", "g*", "<Plug>(asterisk-gz*)")
vim.keymap.set("", "g#", "<Plug>(asterisk-gz#)")

