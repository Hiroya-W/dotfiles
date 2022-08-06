vim.cmd([[
    let g:committia_hooks = {}
    function! g:committia_hooks.edit_open(info)
        " Scroll the diff window from insert mode
        " Map <C-n> and <C-p>
        imap <buffer><C-n> <Plug>(committia-scroll-diff-down-half)
        nmap <buffer><C-n> <Plug>(committia-scroll-diff-down-half)
        imap <buffer><C-p> <Plug>(committia-scroll-diff-up-half)
        nmap <buffer><C-p> <Plug>(committia-scroll-diff-up-half)
    endfunction
]])
