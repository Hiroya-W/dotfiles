local util = require("lspconfig.util")

return {
    autostart = true,
    init_options = {
        extension = {
            name = "gitlab.nvim",
            version = "0.0.1",
        },
        ide = {
            name = "Neovim",
            version = vim.version(),
            vendor = "Neovim",
        },
    },
    default_config = {
        name = "gitlab_lsp",
        cmd = { "gitlab-lsp", "--stdio" },
        filetypes = { "php", "javascript" },
        root_dir = util.root_pattern(".git"),
        single_file_support = true,
    },
    docs = {
        description = "GitLab Language Server",
    },
}
