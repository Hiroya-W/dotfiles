return {
    "haya14busa/vim-asterisk",
    keys = {
        "<Plug>(asterisk-z*)",
        "<Plug>(asterisk-z#)",
        "<Plug>(asterisk-gz*)",
        "<Plug>(asterisk-gz#)",
    },
    config = function()
        vim.g["asterisk#keeppos"] = 1
    end,
}
