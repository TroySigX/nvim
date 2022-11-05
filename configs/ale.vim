let g:airline#extensions#ale#enabled = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = ''

let g:ale_linters = {
      \ 'python' : ['pylint'],
      \ 'java' : ['eclipselsp']
      \ }

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

function! s:GetBufferList() 
  redir =>buflist 
  silent! ls! 
  redir END 
  return buflist 
endfunction

function! ToggleLocationList()
  let curbufnr = winbufnr(0)
  for bufnum in map(filter(split(s:GetBufferList(), '\n'), 'v:val =~ "Location List"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if curbufnr == bufnum
      lclose
      return
    endif
  endfor

  let winnr = winnr()
  let prevwinnr = winnr("#")

  let nextbufnr = winbufnr(winnr + 1)
  try
    lopen
  catch /E776/
      echohl ErrorMsg 
      echo "Location List is Empty."
      echohl None
      return
  endtry
  if winbufnr(0) == nextbufnr
    lclose
    if prevwinnr > winnr
      let prevwinnr-=1
    endif
  else
    if prevwinnr > winnr
      let prevwinnr+=1
    endif
  endif
  " restore previous window
  exec prevwinnr."wincmd w"
  exec winnr."wincmd w"
endfunction

nmap <silent> <F1> :call ToggleLocationList()<CR>
imap <silent> <F1> <Esc> :call ToggleLocationList()<CR>
