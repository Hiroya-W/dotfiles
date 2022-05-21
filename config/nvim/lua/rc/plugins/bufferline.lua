require("bufferline").setup {
}

local opts = { noremap = true }
vim.keymap.set("n", "<leader>bc", ":BufferLinePickClose<CR>", opts)
vim.keymap.set("n", "<leader>bp", ":BufferLinePick<CR>", opts)
