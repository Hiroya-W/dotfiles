local wk = require("which-key")

wk.add({
    { "<leader>b", group = "+Buffer"},
    { "<leader>bp", "<cmd>BufferLinePick<CR>", desc = "BufferLinePick" },

    { "<leader>d", group = "Debug" },

    { "<leader>g", group = "+Git" },

    { "<leader>u",  group = "Upload / Download" },
    { "<leader>ud", "<cmd>TransferDownload<cr>", desc = "Download from remote server (scp)" },
    { "<leader>uf", "<cmd>DiffRemote<cr>",       desc = "Diff file with remote server (scp)" },
    { "<leader>ui", "<cmd>TransferInit<cr>",     desc = "Init/Edit Deployment config" },
    { "<leader>ur", "<cmd>TransferRepeat<cr>",   desc = "Repeat transfer command" },
    { "<leader>uu", "<cmd>TransferUpload<cr>",   desc = "Upload to remote server (scp)" },

    -- gitlab.nvim
    { "<leader>gl", group = "GitLab Workflow" },
})
