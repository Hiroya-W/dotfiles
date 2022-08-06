require("toggleterm").setup {
    size = 20,
    open_mapping = [[<C-t>]],
    shading_factor = 2,
    direction = "float",
    float_opts = {
        border = "curved",
    }
}

local opts = { noremap = true, silent = true }
-- vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
-- vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
vim.keymap.set('t', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
vim.keymap.set('t', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
vim.keymap.set('t', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
vim.keymap.set('t', '<C-l>', [[<C-\><C-n><C-W>l]], opts)


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
    end
})

function _PYTHON_TOGGLE()
    python:toggle()
end
