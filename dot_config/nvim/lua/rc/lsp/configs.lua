-- automatically install
-- https://github.com/neovim/nvim-lspconfig/wiki/Installing-language-servers#automatically
local servers = {
    "lua_ls",
    "intelephense",
    "cssls",
    "tailwindcss",
    "docker_compose_language_service",
    "dockerls",
    "jsonls",
    "ts_ls",
    "marksman",
    "sqls",

    -- "yq", -- :MasonInstall yq for mason-registry
    -- "pylsp",
    -- "pyright",
    -- "rust_analyzer",
    -- "gopls",
    -- "clangd",
}

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})

local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
    ensure_installed = servers, -- ensure these servers are always installed
})

vim.lsp.config("lua_ls", {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    on_init = function(client)
        if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if
                path ~= vim.fn.stdpath("config")
                and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
            then
                return
            end
        end
        client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
            runtime = { version = "LuaJIT" },
            workspace = {
                checkThirdParty = false,
                library = vim.list_extend(vim.api.nvim_get_runtime_file("lua", true), {
                    "${3rd}/luv/library",
                    "${3rd}/busted/library",
                }),
            },
        })
    end,
    settings = {
        Lua = {
            diagnostics = {
                -- 未使用変数は冒頭に`_`をつけていれば警告なし
                unusedLocalExclude = { "_*" },
            },
        },
    },
})

-- Setup lsp config
-- mason_lspconfig.setup_handlers({
--     function(server_name)
--         local opts = {
--             on_attach = require("rc/lsp/handlers").on_attach,
--             capabilities = require("rc/lsp/handlers").capabilities,
--         }
--
--         local has_custom_opts, server_custom_opts = pcall(require, "rc/lsp/settings/" .. server_name)
--         if has_custom_opts then
--             opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
--         end
--
--         if server_name == "rust_analyzer" then
--             -- rust-tools send to options to lspconfig,
--             -- and set up lspconfig automatically.
--             require("rust-tools").setup({
--                 tools = opts.tools,
--                 server = {
--                     on_attach = opts.on_attach,
--                     capabilities = opts.capabilities,
--                 },
--             })
--         elseif server_name == "ts_ls" then
--             require("typescript-tools").setup({
--                 on_attach = opts.on_attach,
--                 capabilities = opts.capabilities,
--                 settings = opts.settings,
--             })
--         else
--             require("lspconfig")[server_name].setup(opts)
--         end
--     end,
-- })

-- Unsupported LSPs by Mason
-- local unsupported_servers = {}
--
-- for _, server_name in ipairs(unsupported_servers) do
--     local opts = {
--         on_attach = require("rc/lsp/handlers").on_attach,
--         capabilities = require("rc/lsp/handlers").capabilities,
--     }
--     local has_custom_opts, server_custom_opts = pcall(require, "rc/lsp/settings/" .. server_name)
--     if has_custom_opts then
--         opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
--     end
--     require("lspconfig")[server_name].setup(opts)
-- end
