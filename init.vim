for f in split(glob(stdpath('config').'/configs/*.vim'))
   exe 'source' f
endfor

:execute "normal! :BufferLineSortByTabs \<cr>"
