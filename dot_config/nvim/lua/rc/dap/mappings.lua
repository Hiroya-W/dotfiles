local wk = require("which-key")

wk.register({
    ["<leader>d"] = {
        name = "Debug",
    },
})

vim.keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", {
    noremap = true,
    silent = true,
    desc = "Continue"
})
vim.keymap.set("n","<leader>dp", "<cmd>lua require'dap'.pause()<cr>", {
    noremap = true,
    silent = true,
    desc = "Pause"
})

vim.keymap.set("n","<leader>di", "<cmd>lua require'dap'.step_into()<cr>", {
    noremap = true,
    silent = true,
    desc = "Step Into"
})
vim.keymap.set("n", "<leader>dB", "<cmd>lua require'dap'.step_back()<cr>", {
    noremap = true,
    silent = true,
    desc = "Step Back"
})
vim.keymap.set("n","<leader>do", "<cmd>lua require'dap'.step_over()<cr>", {
    noremap = true,
    silent = true,
    desc = "Step Over"
})
vim.keymap.set("n","<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", {
    noremap = true,
    silent = true,
    desc = "Step Out"
})

vim.keymap.set("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", {
    noremap = true,
    silent = true,
    desc = "Toggle Breakpoint"
})

vim.keymap.set("n","<leader>dr", "<cmd>lua require'dap'.run_to_cursor()<cr>", {
    noremap = true,
    silent = true,
    desc = "Run To Cursor"
})

vim.keymap.set("n","<leader>ds", "<cmd>lua require'dap'.session()<cr>", {
    noremap = true,
    silent = true,
    desc = "Get Session"
})
vim.keymap.set("n","<leader>dd", "<cmd>lua require'dap'.disconnect()<cr>", {
    noremap = true,
    silent = true,
    desc = "Disconnect"
})

vim.keymap.set("n","<leader>dt", "<cmd>lua require'dap'.repl.toggle()<cr>", {
    noremap = true,
    silent = true,
    desc = "Toggle Repl"
})

vim.keymap.set("n","<leader>dq", "<cmd>lua require'dap'.close()<cr>", {
    noremap = true,
    silent = true,
    desc = "Quit"
})

vim.keymap.set("n", "<leader>dx", '<Cmd>lua require("dapui").toggle()<CR>', {
    noremap = true,
    silent = true,
    desc = "Toggle UI"
})
vim.keymap.set("v", "<leader>de", '<Cmd>lua require("dapui").eval()<CR>', {
    noremap = true,
    silent = true,
    desc = "Evaluate"
})
