return {
    cmd = {
        "clangd",
        -- clang-format warning multiple different client offset_decoding detected for buffer
        -- https://github.com/LunarVim/LunarVim/issues/2597
        -- https://www.reddit.com/r/neovim/comments/tul8pb/lsp_clangd_warning_multiple_different_client/
        "--offset-encoding=utf-16",
    },
}
