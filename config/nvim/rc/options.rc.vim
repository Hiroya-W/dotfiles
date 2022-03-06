" Build encodings.
let &fileencodings = 'ucs-bom,utf-8,iso-2022-jp-3,euc-jp,cp932'

if has('multi_byte_ime')
  set iminsert=0 imsearch=0
endif

"---------------------------------------------------------------------------
" Search
set ignorecase " 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set smartcase " 検索文字列に大文字が含まれている場合は区別して検索する
set incsearch " 検索文字列入力時に順次対象文字列にヒットさせる
set wrapscan " 検索時に最後まで行ったら最初に戻る
set hlsearch " 検索語をハイライト表示


"---------------------------------------------------------------------------
" Edit
set smarttab " Smart insert tab setting.
set expandtab " タブ入力を複数の空白入力に置き換える
set softtabstop=4 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set shiftwidth=4 " 行頭でのTab文字の表示幅
set shiftround " Round indent by shiftwidth.
set autoindent " 改行時に前の行のインデントを継続する
set smartindent " 改行時に前の行の構文をチェックし次の行のインデントを増減する

" Enable backspace delete indent and newline.
set backspace=indent,eol,nostop

" Highlight <>.
set matchpairs+=<:>

set hidden " バッファが編集中でもその他のファイルを開けるように

" Disable folding.
set nofoldenable
set foldmethod=manual

" CursorHold time.
" この時間の間 (ミリ秒単位) 入力がなければ、スワップファイルがディスクに書き込まれる
set updatetime=100

" Set swap
set swapfile

" Set undofile.
set undofile

set virtualedit=block "矩形ビジュアルモードで仮想編集を有効にする。

" Use autofmt.
set formatexpr=autofmt#japanese#formatexpr()

" Default fileformat.
set fileformat=unix
" Automatic recognition of a new line cord.
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される

set clipboard+=unnamedplus

"---------------------------------------------------------------------------
" View

set mouse=a " Enable mouse input
set number " 行番号を表示
set relativenumber " 相対距離
set cursorline " 現在の行を強調表示
" Show <TAB> and <CR>
set list
set listchars=tab:▸\ ,trail:-,precedes:«,nbsp:%
set laststatus=2 " ステータスラインを常に表示
" Height of command line.
set cmdheight=1
set showcmd " 入力中のコマンドをステータスに表示する
set wrap
" Turn down a long line appointed in 'breakat'
set linebreak
set showbreak=\
set breakat=\ \	;:,!?
set whichwrap=b,s,h,l,<,>,[,],~ " カーソルの左右移動で行末から次の行の行頭への移動が可能になる
set breakindent

" Display candidates by popup menu.
set wildmenu " コマンドラインの補完
set wildmode=full

" Display all the information of the tag by the supplement of the Insert mode.
set showfulltag
" Can supplement a tag in a command-line.
set wildoptions+=tagfile
" Complete all candidates
set wildignorecase

set history=500 " 保存するコマンド履歴の数

" Completion setting.
set completeopt=menuone
" Don't complete from other buffer.
set complete=.
" Use "/" for path completion
set completeslash=slash

" Splitting a window will put the new window below the current one.
set splitbelow
" Splitting a window will put the new window right the current one.
set splitright

set ttyfast " 再描画のとき、行挿入／削除コマンドを使う代わりに、より多くの文字が画面に送られる

" Enable true color
if exists('+termguicolors') && !has('gui_running')
  set termguicolors
endif

set inccommand=nosplit " 文字列置換をインタラクティブに表示する

highlight NotifyERRORBorder guifg=#8A1F1F
highlight NotifyWARNBorder guifg=#79491D
highlight NotifyINFOBorder guifg=#4F6752
highlight NotifyDEBUGBorder guifg=#8B8B8B
highlight NotifyTRACEBorder guifg=#4F3552
highlight NotifyERRORIcon guifg=#F70067
highlight NotifyWARNIcon guifg=#F79000
highlight NotifyINFOIcon guifg=#A9FF68
highlight NotifyDEBUGIcon guifg=#8B8B8B
highlight NotifyTRACEIcon guifg=#D484FF
highlight NotifyERRORTitle  guifg=#F70067
highlight NotifyWARNTitle guifg=#F79000
highlight NotifyINFOTitle guifg=#A9FF68
highlight NotifyDEBUGTitle  guifg=#8B8B8B
highlight NotifyTRACETitle  guifg=#D484FF
highlight link NotifyERRORBody Normal
highlight link NotifyWARNBody Normal
highlight link NotifyINFOBody Normal
highlight link NotifyDEBUGBody Normal
highlight link NotifyTRACEBody Normal
