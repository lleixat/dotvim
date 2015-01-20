" -----------------------------------------------------------------------------
" Sartify
" https://github.com/mhinz/vim-startify  {{{
" -----------------------------------------------------------------------------
let g:startify_list_order = [
            \ ['# Recently opened files:'],
            \ 'files',
            \ ['# Recently modified files in the current directory:'],
            \ 'dir',
            \ ['# Sessions:'],
            \ 'sessions',
            \ ['# Bookmarks:'],
            \ 'bookmarks',
            \ ]
let g:startify_session_dir   = '~/.vim/sessions'
let g:startify_show_sessions = 1
let g:startify_bookmarks     = [
            \ '~/.vim/vimrc',
            \ '~/.vim/snips/',
            \ '~/.vim/etc/helpers.vim',
            \ '~/.vim/etc/startify.vim',
            \ '~/.vim/etc/switch_definitions.vim',
            \ '~/.vim/etc/neobundle.vim',
            \ '~/Dev/parfum_d_O/src/',
            \ '~/bin/mageit',
            \ ]
