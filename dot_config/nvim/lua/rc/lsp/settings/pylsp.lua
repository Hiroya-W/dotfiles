-- nvim-lsp-installer
-- https://github.com/williamboman/nvim-lsp-installer/blob/main/lua/nvim-lsp-installer/servers/pylsp/README.md
-- :PylspInstall pyls-flake8 pylsp-mypy pyls-isort python-lsp-black
--
-- Here, I use null-ls, so you don't need to install plugins using PylspInstall cmd.

return {
    settings = {
        pylsp = {
            configurationSources = { "flake8", "mypy", "isort", "black" },
            plugins = {
                -- https://github.com/emanspeaks/pyls-flake8/
                -- load setup.cfg, tox.ini, .flake8
                pyflakes = { enabled = false },
                flake8 = { enabled = false },
                pylint = { enabled = false },
                pycodestyle = { enabled = false },
                yapf = { enabled = false },
                -- black enabled if python-lsp-black installed
            },
        },
    },
}
