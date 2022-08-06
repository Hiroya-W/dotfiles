-- カーソル下にある単語を検索する
-- *: 順方向検索, #: 逆方向検索
-- 単語区切りでマッチする
-- <fuga>は hogefugahoge のfugaにマッチしない
vim.keymap.set("", "*", "<Plug>(asterisk-z*)")
vim.keymap.set("", "#", "<Plug>(asterisk-z#)")

-- 単語区切りでマッチさせない
vim.keymap.set("", "g*", "<Plug>(asterisk-gz*)")
vim.keymap.set("", "g#", "<Plug>(asterisk-gz#)")

vim.g["asterisk#keeppos"] = 1
