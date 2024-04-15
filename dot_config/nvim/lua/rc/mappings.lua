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
    desc = "Find files",
})

vim.keymap.set("n", "<leader>tg", ":Telescope live_grep<CR>", {
    noremap = true,
    silent = true,
    desc = "Live grep",
})

-- NvimTree
-- vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })

-- https://github.com/nvim-tree/nvim-tree.lua/wiki/Recipes#smart-nvim-tree-toggling
local nvimTreeFocusOrToggle = function()
    local nvimTree = require("nvim-tree.api")
    local currentBuf = vim.api.nvim_get_current_buf()
    local currentBufFt = vim.api.nvim_get_option_value("filetype", { buf = currentBuf })
    if currentBufFt == "NvimTree" then
        nvimTree.tree.toggle()
    else
        nvimTree.tree.focus()
    end
end
vim.keymap.set("n", "<leader>e", nvimTreeFocusOrToggle)

-- LazyGit
vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { silent = true })

-- hop.nvim
vim.api.nvim_set_keymap(
    "n",
    "f",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
    {}
)
vim.api.nvim_set_keymap(
    "n",
    "F",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
    {}
)
vim.api.nvim_set_keymap(
    "o",
    "f",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>",
    {}
)
vim.api.nvim_set_keymap(
    "o",
    "F",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>",
    {}
)
vim.api.nvim_set_keymap(
    "",
    "t",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
    {}
)
vim.api.nvim_set_keymap(
    "",
    "T",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
    {}
)
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

-- nvim-dap
vim.keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", {
    noremap = true,
    silent = true,
    desc = "Continue",
})
vim.keymap.set("n", "<leader>dp", "<cmd>lua require'dap'.pause()<cr>", {
    noremap = true,
    silent = true,
    desc = "Pause",
})

vim.keymap.set("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", {
    noremap = true,
    silent = true,
    desc = "Step Into",
})
vim.keymap.set("n", "<leader>dB", "<cmd>lua require'dap'.step_back()<cr>", {
    noremap = true,
    silent = true,
    desc = "Step Back",
})
vim.keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", {
    noremap = true,
    silent = true,
    desc = "Step Over",
})
vim.keymap.set("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", {
    noremap = true,
    silent = true,
    desc = "Step Out",
})

vim.keymap.set("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", {
    noremap = true,
    silent = true,
    desc = "Toggle Breakpoint",
})

vim.keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.run_to_cursor()<cr>", {
    noremap = true,
    silent = true,
    desc = "Run To Cursor",
})

vim.keymap.set("n", "<leader>ds", "<cmd>lua require'dap'.session()<cr>", {
    noremap = true,
    silent = true,
    desc = "Get Session",
})
vim.keymap.set("n", "<leader>dd", "<cmd>lua require'dap'.disconnect()<cr>", {
    noremap = true,
    silent = true,
    desc = "Disconnect",
})

vim.keymap.set("n", "<leader>dt", "<cmd>lua require'dap'.repl.toggle()<cr>", {
    noremap = true,
    silent = true,
    desc = "Toggle Repl",
})

vim.keymap.set("n", "<leader>dq", "<cmd>lua require'dap'.close()<cr>", {
    noremap = true,
    silent = true,
    desc = "Quit",
})

vim.keymap.set("n", "<leader>dx", '<Cmd>lua require("dapui").toggle()<CR>', {
    noremap = true,
    silent = true,
    desc = "Toggle UI",
})
vim.keymap.set("v", "<leader>de", '<Cmd>lua require("dapui").eval()<CR>', {
    noremap = true,
    silent = true,
    desc = "Evaluate",
})

-- skkeleton
vim.keymap.set("i", "<C-j>", "<Plug>(skkeleton-enable)", {
    noremap = true,
    silent = true,
    desc = "Evaluate",
})
