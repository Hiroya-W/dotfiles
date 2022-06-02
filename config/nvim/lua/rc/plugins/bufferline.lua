require("bufferline").setup {
}

local wk = require("which-key")
wk.register({
    ["<leader>bp"] = { "<cmd>BufferLinePick<CR>", "BufferLinePick" }
})
