local wk = require("which-key")
local M = require 'which-key.view'
local Keys = require 'which-key.keys'
local Layout = require 'which-key.layout'
local Util = require 'which-key.util'
local config = require 'which-key.config'

-- E5108: Error executing lua ...te/pack/packer/opt/which-key.nvim/lua/which-key/view.lua:52: Window was closed immediately
-- https://github.com/folke/which-key.nvim/issues/273
local function on_keys(opts)
    local buf = vim.api.nvim_get_current_buf()

    while true do
        -- loop
        M.read_pending()

        local results = Keys.get_mappings(M.mode, M.keys, buf)

        --- Check for an exact match. Feedkeys with remap
        if results.mapping and not results.mapping.group and #results.mappings == 0 then
            M.hide()
            if results.mapping.fn then
                results.mapping.fn()
            else
                M.execute(M.keys, M.mode, buf)
            end
            return
        end

        -- Check for no mappings found. Feedkeys without remap
        if #results.mappings == 0 then
            M.hide()
            -- only execute if an actual key was typed while WK was open
            if opts.auto then
                M.execute(M.keys, M.mode, buf)
            end
            return
        end

        local layout = Layout:new(results)

        -- if not M.is_valid() then
        --   M.show()
        -- end

        M.render(layout:layout(M.win))

        vim.cmd([[redraw]])

        local c = M.getchar()

        if c == Util.t("<esc>") then
            M.on_close()
            break
        elseif c == Util.t(config.options.popup_mappings.scroll_down) then
            M.scroll(false)
        elseif c == Util.t(config.options.popup_mappings.scroll_up) then
            M.scroll(true)
        elseif c == Util.t("<bs>") then
            M.back()
        else
            M.keys = M.keys .. c
        end
    end
end

local function open(keys, opts)
    opts = opts or {}
    M.keys = keys or ''
    M.mode = opts.mode or Util.get_mode()
    M.count = vim.api.nvim_get_vvar 'count'
    M.reg = vim.api.nvim_get_vvar 'register'

    on_keys(opts)
end

local ignore_filetype = { 'TelescopePrompt' }
local show = wk.show
wk.show = function(keys, opts)
    if vim.tbl_contains(ignore_filetype, vim.bo.filetype) then
        open(keys, opts)
        return
    else
        show(keys, opts)
    end
end


wk.setup()

wk.register({
    ["<leader>b"] = {
        name = "+Buffer",
    },
})

wk.register({
    ["<leader>bp"] = { "<cmd>BufferLinePick<CR>", "BufferLinePick" }
})

wk.register({
    ["<leader>d"] = {
        name = "Debug",
    },
})
