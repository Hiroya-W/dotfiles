set encoding=utf-8 "ファイル読み込み時の文字エンコード
scriptencoding utf-8 "マルチバイト文字

"-----------------------------------------
"              ColorScheme
"-----------------------------------------
set termguicolors     " enable true colors support
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum" 
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum" 
"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme
"colorscheme ayu
colorscheme desert
"set t_Co=256

"-----------------------------------------
"              My Settings
"-----------------------------------------
" ==setting==
set fenc=utf-8 "文字コードをUFT-8に設定
set fileencoding=utf-8 " 保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される
set ambiwidth=double " □や○文字が崩れる問題を解決
set nobackup " バックアップファイルを作らない
set noswapfile " スワップファイルを作らない
set autoread " 編集中のファイルが変更されたら自動で読み直す
set hidden " バッファが編集中でもその他のファイルを開けるように
set showcmd " 入力中のコマンドをステータスに表示する


" ==見た目系==
set number " 行番号を表示
set relativenumber " 相対距離
" F3で相対、絶対表示の切り替え
nnoremap <F3> :<C-u>setlocal relativenumber!<CR>
set cursorline " 現在の行を強調表示
" set cursorcolumn " 現在の行を強調表示（縦）
set virtualedit=onemore " 行末の1文字先までカーソルを移動できるように
set smartindent " インデントはスマートインデント
"set visualbell " ビープ音を可視化
set showmatch " 括弧入力時の対応する括弧を表示
set laststatus=2 " ステータスラインを常に表示
set wildmenu " コマンドラインの補完
set history=5000 " 保存するコマンド履歴の数
syntax enable " シンタックスハイライトの有効化


" ==Tab系==
set list listchars=tab:\▸\- " 不可視文字を可視化(タブが「▸-」と表示される)
" Tab文字を半角スペースにする set expandtab
set tabstop=4 " 行頭以外のTab文字の表示幅（スペースいくつ分）
set shiftwidth=4 " 行頭でのTab文字の表示幅
set expandtab " タブ入力を複数の空白入力に置き換える
set smarttab
set shiftround
set softtabstop=4 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent " 改行時に前の行のインデントを継続する
set smartindent " 改行時に前の行の構文をチェックし次の行のインデントを増減する


" ==検索系==
set ignorecase " 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set smartcase " 検索文字列に大文字が含まれている場合は区別して検索する
set incsearch " 検索文字列入力時に順次対象文字列にヒットさせる
set wrapscan " 検索時に最後まで行ったら最初に戻る
set hlsearch " 検索語をハイライト表示
"set inccommand=split

" ESCキー2度押しでハイライトの切り替え
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

" == カーソル==
set whichwrap=b,s,h,l,<,>,[,],~ " カーソルの左右移動で行末から次の行の行頭への移動が可能になる
" 行が折り返し表示されていた場合、行単位ではなく表示行単位でカーソルを移動する
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk
" バックスペースキーの有効化
set backspace=indent,eol,start
set mouse =a

" ==Tag Jamp""
set showmatch " 括弧の対応関係を一瞬表示する
source $VIMRUNTIME/macros/matchit.vim " Vimの「%」を拡張する

" == 保存とノーマルモード切り替え==
inoremap <silent> jj <ESC>:<C-u>w<CR>
inoremap <silent> hh <ESC>:<C-u>w<CR>
inoremap <silent> kk <ESC>:<C-u>w<CR>

" == ウィンドウ移動 ==
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

set clipboard=unnamedplus

"----------------------------------------------------------
"                  ステータスラインの設定
"----------------------------------------------------------
set laststatus=2 " ステータスラインを常に表示
set showmode " 現在のモードを表示
set showcmd " 打ったコマンドをステータスラインの下に表示
set ruler " ステータスラインの右側にカーソルの現在位置を表示する

