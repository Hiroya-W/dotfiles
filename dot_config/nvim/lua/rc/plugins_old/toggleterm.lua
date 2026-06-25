require("toggleterm").setup({
    size = 20,
    open_mapping = [[<C-t>]],
    shading_factor = 2,
    direction = "float",
    float_opts = {
        border = "curved",
    },
})

local opts = { noremap = true, silent = true }

-- Custom Terminals
-- Exec: `:lua _FUNCTION_NAME()`
local Terminal = require("toggleterm.terminal").Terminal

local htop = Terminal:new({ cmd = "htop", hidden = true })

function _HTOP_TOGGLE()
    htop:toggle()
end

local python = Terminal:new({
    cmd = "python",
    direction = "horizontal",
    hidden = true,
    on_open = function(term)
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", opts)
    end,
})

function _PYTHON_TOGGLE()
    python:toggle()
end
