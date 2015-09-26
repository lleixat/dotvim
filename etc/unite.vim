" -----------------------------------------------------------------------------
" Unite Menus {{{1
" -----------------------------------------------------------------------------
" Config:
let g:usmm = {
            \ 'char' : {
                \ 'bullet': '› ',
                \ 'key' : '✱ ',
                \ 'gap' : ' ',
                \ 'width' : [30,55],
                \ }
            \ }

let g:unite_menus = ['unites', 'git', 'config', 'plugins', 'refactor']

" Contruct menu entry from list
function! Populate_unite_menu_candidates(submenu, menu) abort
    let g:unite_source_menu_menus[a:menu].command_candidates = []

    for items in a:submenu
        call add(g:unite_source_menu_menus[a:menu].command_candidates,
                    \ MakeUniteMenuTitle(items))
    endfor
    return g:unite_source_menu_menus[a:menu].command_candidates
endfunction

" Construct Title string
function! MakeUniteMenuTitle(items) abort
    let l:str = [
                \ g:usmm.char.bullet . a:items[0],
                \ empty(a:items[1])? '': '[' . a:items[1] . ']',
                \ empty(a:items[2])? '': g:usmm.char.key . a:items[2]
                \ ]
    " calculate gap
    let l:gap = []
    call add(l:gap, g:usmm.char.width[0] - strlen(l:str[0]))
    call add(l:gap, g:usmm.char.width[1] - strlen(l:str[1].l:str[2]) + l:gap[0])

    let lenths = [
                \ strlen(l:str[0]),
                \ strlen(l:str[1]),
                \ strlen(l:str[2]),
                \ ]

    let l:title = l:str[0].repeat(g:usmm.char.gap, l:gap[0])
                \ .l:str[1].repeat(g:usmm.char.gap, l:gap[1])
                \ .l:str[2]

    "echo "#### gaps ####"
    "echo l:gap
    "echo "#### items ####"
    "echo a:items
    "echo "### str ###"
    "echo l:str
    "echo "###title###"
    "echo l:title
    "echo "### lenths ###"
    "echo l:lenths
    "echo "\n"

    if len(a:items) > 3
        let l:plop = [l:title, a:items[3]]
    else
        let l:plop = l:title
    endif

    return l:plop
endfunction



let g:unite_source_menu_menus = {}


" -----------------------------------------------------------------------------
" Git commands {{{2
" -----------------------------------------------------------------------------

" \ 'description' : MakeUniteMenuTitle(['', 'SCM git', '[zone]g']),
" render : '  git - ›                          [SCM git]         ⌘ [zone]g'
let g:unite_source_menu_menus.git = {
            \ 'description' : MakeUniteMenuTitle(['', 'SCM git', '[zone]g']),
            \}

" list = [ ['desc', 'category', 'key', 'Gstatus'], [...] ]
" render : [ ['› git status       (Fugitive)        ⌘ ,gs', 'Gstatus'], [...] ]
let g:unite_source_menu_menus.git.command_candidates = [
            \['git status'  , 'Fugitive'            , '<leader>gs', 'Gstatus']                            ,
            \['git diff'    , 'Fugitive'            , '<leader>gd', 'Gdiff']                              ,
            \['git commit'  , 'Fugitive'            , '<leader>gc', 'Gcommit']                            ,
            \['git log'     , 'Fugitive'            , '<leader>gl', 'exe "silent Glog | Unite quickfix"'] ,
            \['git blame'   , 'Fugitive'            , '<leader>gb', 'Gblame']                             ,
            \['git stage'   , 'Fugitive'            , '<leader>gw', 'Gwrite']                             ,
            \['git checkout', 'Fugitive'            , '<leader>go', 'Gread']                              ,
            \['git rm'      , 'Fugitive'            , '<leader>gr', 'Gremove']                            ,
            \['git mv'      , 'Fugitive'            , '<leader>gm', 'exe "Gmove " input("destination: ")'],
            \['git push'    , 'Fugitive - buff left', '<leader>gp', 'Git! push']                          ,
            \['git pull'    , 'Fugitive - buff left', '<leader>gP', 'Git! pull']                          ,
            \['git prompt'  , 'Fugitive - buff left', '<leader>gi', 'exe "Git! " input("git command: ")'] ,
            \['git cd'      , 'Fugitive'            , ''          , 'Gcd']                                ,
            \]

" 2}}}

" -----------------------------------------------------------------------------
" Common vim commands {{{2
" -----------------------------------------------------------------------------
let g:unite_source_menu_menus.config = {
            \ 'description' : MakeUniteMenuTitle(['', 'Vim Config', '[zone]c']),
            \}
let g:unite_source_menu_menus.config.command_candidates = [
            \['Reload vim config'       , 'vim/rc'  , '~/.vim/vimrc'                      , 'source ~/.vim/vimrc']                    ,
            \['Edit vim config'         , 'vim/rc'  , '~/.vim/vimrc'                      , 'edit ~/.vim/vimrc']                      ,
            \['Edit Switch definitions' , 'vim/etc' , '~/.vim/etc/switch_definitions.vim' , 'edit ~/.vim/etc/switch_definitions.vim'] ,
            \['Edit NeoBundle config'   , 'vim/etc' , '~/.vim/etc/neobundle.vim'          , 'edit ~/.vim/etc/neobundle.vim']          ,
            \['Edit Unite config'       , 'vim/etc' , '~/.vim/etc/unite.vim'              , 'edit ~/.vim/etc/unite.vim']              ,
            \['Edit TagBar config'      , 'vim/etc' , '~/.vim/etc/tagbar_types.vim'       , 'edit ~/.vim/etc/tagbar_types.vim']       ,
            \]
" 2}}}

" -----------------------------------------------------------------------------
" Plugins {{{2
" -----------------------------------------------------------------------------
let g:unite_source_menu_menus.plugins = {
            \ 'description' : MakeUniteMenuTitle(['','NeoBundle', '[zone]p']),
            \}
let g:unite_source_menu_menus.plugins.command_candidates = [
            \['Edit config'   , 'NeoBundle - Config', '~/.vim/etc/neobundle.vim', 'edit ~/.vim/etc/neobundle.vim'],
            \['Update Bundles', 'NeoBundle'         , 'neobundle/update'        , 'Unite neobundle/update']       ,
            \]
" 2}}}

" -----------------------------------------------------------------------------
" Unite {{{2
" -----------------------------------------------------------------------------
let g:unite_source_menu_menus.unites = {
            \ 'description' : MakeUniteMenuTitle(['', 'Unite', '[zone]p']),
            \}
let g:unite_source_menu_menus.unites.command_candidates = [
            \['Buffer list',             'Unite', '<C-S-b>', 'Unite buffer']                                       ,
            \['File list (cur. folder)', 'Unite', '<C-S-f>', 'Unite -start-insert file_rec/async']                 ,
            \['File list filtered',      'Unite', '<C-S-F>', 'exe "Unite file_rec/async -input=" input("filter: ")'],
            \['Yank history',            'Unite', '<C-y>'  , 'Unite history/yank']                                 ,
            \]
" 2}}}

" -----------------------------------------------------------------------------
" Refactor {{{2
" -----------------------------------------------------------------------------
let g:unite_source_menu_menus.refactor = {
            \ 'description' : MakeUniteMenuTitle(['', 'Refactor (WIP)', '[zone]e']),
            \}

let g:unite_source_menu_menus.refactor.command_candidates = [
            \['Nothing here for now', '...', '...', '...'],
            \]
" 2}}}

" Remap {{{2
" ie for 'git' menu : nnoremap <silent>[menu]git :Unite -silent -start-insert menu:git<CR>
" -----------------------------------------------------------------------------
function! Create_unite_menu() abort
    for submenu in g:unite_menus
        let l:menu = Populate_unite_menu_candidates(g:unite_source_menu_menus[submenu].command_candidates, submenu)
        execute "nnoremap <silent>[menu]" . submenu . " :Unite -silent -start-insert menu:" . submenu . "<CR>"
    endfor
endfunction

execute Create_unite_menu()
" 2}}}

" 1}}}


" -----------------------------------------------------------------------------
" vim: foldmethod=marker
