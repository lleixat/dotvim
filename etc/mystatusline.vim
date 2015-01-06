" -----------------------------------------------------------------------------
" Set up the status line {{{
" -----------------------------------------------------------------------------
fun! <sid>set_statusline()
    let l:s1="%-3.3n\\ %f\\ %h%m%r%w"
    let l:s2="%{fugitive#statusline()}"
    let l:s5="%{SyntasticStatuslineFlag()}"
    let l:s3="[%{strlen(&filetype)?&filetype:'?'},%{&encoding},%{&fileformat}]"
    let l:s4="%=\\ 0x%-8b\\ \\ %-14.(%l,%c%V\\[ε%L\\]%)\\ %<%03p%%"
    execute "set statusline=" . l:s1 . l:s2 . l:s5 . l:s3 . l:s4
endfun
set laststatus=2
call <sid>set_statusline()

" }}}

" vim: fdm=marker
