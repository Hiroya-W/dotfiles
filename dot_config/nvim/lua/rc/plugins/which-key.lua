local wk = require("which-key")

wk.setup()

wk.register({
    ["<leader>b"] = {
        name = "+Buffer",
    },
})

wk.register({
    ["<leader>bp"] = { "<cmd>BufferLinePick<CR>", "BufferLinePick" },
})

wk.register({
    ["<leader>d"] = {
        name = "Debug",
    },
})

wk.register({
    ["<leader>g"] = {
        name = "+Git",
    },
})

wk.register({
    ["<leader>u"] = {
        name = "Upload / Download",
        d = { "<cmd>TransferDownload<cr>", "Download from remote server (scp)" },
        u = { "<cmd>TransferUpload<cr>", "Upload to remote server (scp)" },
        f = { "<cmd>DiffRemote<cr>", "Diff file with remote server (scp)" },
        i = { "<cmd>TransferInit<cr>", "Init/Edit Deployment config" },
        r = { "<cmd>TransferRepeat<cr>", "Repeat transfer command" },
    }
})
