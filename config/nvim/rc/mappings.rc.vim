let mapleader = "\<space>"
" F3で相対、絶対表示の切り替え
nnoremap <F3> :<C-u>setlocal relativenumber!<CR>
" ESCキー2度押しでハイライトの切り替え
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

" 保存とノーマルモード切り替え
inoremap <silent> jj <ESC>:<C-u>w<CR>
inoremap <silent> hh <ESC>:<C-u>w<CR>
inoremap <silent> kk <ESC>:<C-u>w<CR>

" ウィンドウ移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk
