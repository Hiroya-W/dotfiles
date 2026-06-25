return {
    "harrisoncramer/gitlab.nvim",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
        "stevearc/dressing.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    build = function()
        require("gitlab.server").build(true)
    end,
    config = function()
        local gitlab = require("gitlab")
        gitlab.setup({
            discussion_tree = {
                draft_mode = true,
            },
        })

        vim.keymap.set("n", "<leader>gls", gitlab.summary, { desc = "Open the MR" })
        vim.keymap.set("n", "<leader>glb", gitlab.open_in_browser, { desc = "Open the MR in browser" })
        vim.keymap.set("n", "<leader>glc", gitlab.summary, { desc = "Choose a merge request" })
        vim.keymap.set("n", "<leader>glr", gitlab.review, { desc = "Open the reviewer pane" })
        vim.keymap.set("n", "<leader>glp", gitlab.pipeline, { desc = "View the status of the pipeline" })
        vim.keymap.set("n", "<leader>glg", require("gitlab.server").restart, { desc = "Restart server" })
        -- vim.keymap.set("n", "<leader>gl", gitlab.copy_mr_url, { desc = "Copies the URL of the MR" })
    end,
}
