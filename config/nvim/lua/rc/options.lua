local opt = vim.opt

vim.cmd("filetype plugin indent on")
vim.cmd("syntax on")

vim.g.mapleader = " "

----------------------------------------------------------------------------
-- Search
opt.ignorecase = true -- 検索文字列が小文字の場合は大文字小文字を区別なく検索する
opt.smartcase = true  -- 検索文字列に大文字が含まれている場合は区別して検索する
opt.incsearch = true  -- 検索文字列入力時に順次対象文字列にヒットさせる
opt.wrapscan = true   -- 検索時に最後まで行ったら最初に戻る
opt.hlsearch = true   -- 検索語をハイライト表示

---------------------------------------------------------------------------
-- Edit
opt.smarttab = true    -- Smart insert tab setting.
opt.expandtab = true   -- タブ入力を複数の空白入力に置き換える
opt.tabstop = 4        -- 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
opt.shiftwidth = 4     -- 行頭でのTab文字の表示幅
opt.autoindent = true  -- 改行時に前の行のインデントを継続する
opt.smartindent = true -- 改行時に前の行の構文をチェックし次の行のインデントを増減する

-- Enable backspace delete indent and newline.
opt.backspace = "indent,eol,nostop"
-- Add angle brackets to the list of recognized characters in a pair
opt.matchpairs:append{"<:>"}

opt.hidden = true

-- この時間の間 (ミリ秒単位) 入力がなければ、スワップファイルがディスクに書き込まれる 
opt.updatetime = 100

opt.swapfile = true
opt.undofile = true

-- Default fileformat
opt.fileformat = "unix"
--opt.fileformats = "unix, dos, mac"
-- OSのクリップボードを使う
-- +レジスタ：Ubuntuの[Ctrl-v]で貼り付けられるもの unnamedplus
-- *レジスタ：マウス中クリックで貼り付けられるもの unnamed
opt.clipboard:append{"unnamedplus"}
opt.clipboard:append{"unnamed"}

---------------------------------------------------------------------------
-- View
opt.mouse = "a" -- Enable mouse input
opt.number = true -- 行番号を表示
opt.relativenumber = true -- 相対距離
opt.cursorline = true -- 現在の行を強調表示
-- Show <TAB> and <CR>
opt.list = true 
opt.listchars = {tab = "▸ ",trail = "-", precedes = "«"}
opt.laststatus = 2 -- ステータスラインを常に表示
-- Height of command line.
opt.cmdheight = 1
opt.showcmd = true -- 入力中のコマンドをステータスに表示する
opt.wrap = true 
-- Turn down a long line appointed in 'breakat'
opt.linebreak = true
opt.showbreak = "\\"
opt.breakat = " 	;:,!?"
opt.whichwrap = "b,s,h,l,<,>,[,],~" -- カーソルの左右移動で行末から次の行の行頭への移動が可能になる
opt.breakindent = true

-- Display candidates by popup menu.
opt.wildmenu = true -- コマンドラインの補完
opt.wildmode = "full"

-- Display all the information of the tag by the supplement of the Insert mode.
opt.showfulltag = true
-- Can supplement a tag in a command-line.
opt.wildoptions:append{"tagfile"}
-- Complete all candidates
opt.wildignorecase = true

opt.history = 500 -- 保存するコマンド履歴の数

-- Completion setting.
opt.completeopt = "menuone"
-- Don't complete from other buffer.
opt.complete= "."
-- Use "/" for path completion
opt.completeslash= "slash" 

-- Splitting a window will put the new window below the current one.
opt.splitbelow = true
-- Splitting a window will put the new window right the current one.
opt.splitright = true 

opt.ttyfast = true -- 再描画のとき、行挿入／削除コマンドを使う代わりに、より多くの文字が画面に送られる
