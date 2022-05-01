lua <<EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = 'all',
    additional_vim_regex_highlighting = false,
    highlight = {
        enable = true,
        disable = {},
    },
}

EOF
