require("rc/dap/mappings")
require("rc/dap/settings/lua")

local dap, dapui = require "dap", require "dapui"

dapui.setup() -- use default
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

-- references:
-- https://alpha2phi.medium.com/neovim-for-beginners-debugging-using-dap-44626a767f57
--
