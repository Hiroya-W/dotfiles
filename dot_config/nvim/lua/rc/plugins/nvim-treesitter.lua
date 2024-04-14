require("nvim-treesitter.configs").setup({
    modules = {},
    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = true,
    -- A list of parser names, or "all"
    ensure_installed = {
        "bash",
        "c",
        "cmake",
        "comment",
        "cpp",
        "fish",
        "git_config",
        "git_rebase",
        "gitcommit",
        "gitignore",
        "go",
        "gomod",
        "gosum",
        "graphql",
        "hjson",
        "html",
        "http",
        "ini",
        "java",
        "javascript",
        "jq",
        "jsdoc",
        "json",
        "json5",
        "jsonc",
        "latex",
        "lua",
        "luadoc",
        "luap",
        "make",
        "markdown",
        "perl",
        "php",
        "python",
        "ruby",
        "rust",
        "scss",
        "sql",
        "toml",
        "typescript",
        "vim",
        "vimdoc",
        "yaml"
    },
    auto_install = false,

    -- List of parsers to ignore installing (for "all")
    ignore_install = {
        "phpdoc",
    },

    highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
        -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
        -- the name of the parser)
        -- list of language that will be disabled
        disable = {},

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
    indent = {
        -- nvim-treesitter's indent is broken, use nvim-yati instead.
        enable = false,
    },
    rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = 300, -- Do not enable for files with more than n lines, int
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
    },
    yati = {
        enable = true,
    },
})
