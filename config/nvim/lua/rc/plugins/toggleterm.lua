require("toggleterm").setup{
    size = 20,
    open_mapping = [[<C-t>]],
    shading_factor = 2,
    direction = "float",
    float_opts = {
        border = "curved",
    }
}

-- Custom Terminals
-- Exec: `:lua _FUNCTION_NAME()`
local Terminal = require("toggleterm.terminal").Terminal

local htop = Terminal:new({ cmd = "htop", hidden = true })

function _HTOP_TOGGLE()
    htop:toggle()
end

local python = Terminal:new({ cmd = "python", hidden = true })

function _PYTHON_TOGGLE()
    python:toggle()
end
