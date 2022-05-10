local M = {}

M.setup = function()
    -- Change the border of the window displaying the results of requests
    -- sent from the client to the LSP.

    -- hint(hover)
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
        vim.lsp.handlers.hover, {
        border = "rounded",
    })

    -- candidates signature(member definitionns)
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
        vim.lsp.handlers.signature_help, {
        border = "rounded",
    })
end

local function lsp_keymaps(bufnr)
    local opts = { noremap = true, silent = true }

    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    -- vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    -- vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    -- vim.api.nvim_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
    --
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>fmt', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", '<cmd>lua vim.diagnostic.open_float(nil, {border = "rounded", scope = "cursor"})<CR>', opts)
    vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]

    -- Use UIs provided by lspsaga
    -- See https://github.com/tami5/lspsaga.nvim/wiki
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gh", ":Lspsaga lsp_finder<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", ":Lspsaga code_action<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "v", "<leader>ca", ":<C-U>Lspsaga range_code_action<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", ":Lspsaga hover_doc<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-f>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-b>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":Lspsaga signature_help<CR>", opts)
    -- close rename win use <C-c> in insert mode or `q` in noremal mode or `:q`
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", ":Lspsaga rename<CR>", opts)
    -- don't work?
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gd", ":Lspsaga preview_definition<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>cl", ":Lspsaga show_line_diagnostics<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>cc", ":Lspsaga show_cursor_diagnostics<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", ":Lspsaga diagnostic_jump_prev<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", ":Lspsaga diagnostic_jump_next<CR>", opts)

    -- Use UIs provided by trouble
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TroubleToggle lsp_references<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", ":TroubleToggle lsp_definitions<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TroubleToggle lsp_implementations<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>cw", ":TroubleToggle workspace_diagnostics<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>cd", ":TroubleToggle document_diagnostics<CR>", opts)
end

local function common_capabilities()
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    if status_ok then
        capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
    end

    capabilities.textDocument.completion.completionItem.snippetSupport = true
    return capabilities
end

M.on_attach = function(client, bufnr)
    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    if client.name == "pylsp" then
        -- Use null-ls format
        client.resolved_capabilities.document_formatting = false
    end
    lsp_keymaps(bufnr)
end

M.capabilities = common_capabilities()

return M
