lua require("todo-comments").setup()

let g:the_primeagen_qf_g = 0

augroup fixlist
    autocmd!
    autocmd BufWinEnter quickfix let g:the_primeagen_qf_g = 1
    autocmd BufWinLeave * let g:the_primeagen_qf_g = 0
augroup END


fun! ToggleTodoList()
    if g:the_primeagen_qf_g == 1
        let g:the_primeagen_qf_g = 0
        cclose
    else
        let g:the_primeagen_qf_g = 1
        TodoQuickFix
    endif
endfun

map <silent> <F3> <Esc>:call ToggleTodoList()<CR>
imap <silent> <F3> <Esc>:call ToggleTodoList()<CR>
tnoremap <silent> <F3> <Esc>:call ToggleTodoList()<CR>
