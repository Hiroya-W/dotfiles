-- カーソル下にある単語を検索する
-- *: 順方向検索, #: 逆方向検索
-- 単語区切りでマッチする
-- <fuga>は hogefugahoge のfugaにマッチしない
vim.keymap.set("n", "*", "<Plug>(asterisk-z*)")
vim.keymap.set("v", "*", "<Plug>(asterisk-z*)")

vim.keymap.set("n", "#", "<Plug>(asterisk-z#)")
vim.keymap.set("v", "#", "<Plug>(asterisk-z#)")

-- 単語区切りでマッチさせない
vim.keymap.set("n", "g*", "<Plug>(asterisk-gz*)")
vim.keymap.set("v", "g*", "<Plug>(asterisk-gz*)")

vim.keymap.set("n", "g#", "<Plug>(asterisk-gz#)")
vim.keymap.set("v", "g#", "<Plug>(asterisk-gz#)")

vim.g["asterisk#keeppos"] = 1
