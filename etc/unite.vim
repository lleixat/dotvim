" -----------------------------------------------------------------------------
" Unite Menus {{{1
" -----------------------------------------------------------------------------
" Config:
let g:usmm = {
            \ 'char' : {
                \ 'bullet': '› ',
                \ 'key' : '⌘ ',
                \ 'gap' : ' ',
                \ 'width' : [30,55],
                \ }
            \ }

let g:unite_menus = ['unites', 'git', 'config', 'plugins']

" Contruct menu entry from list
function! Populate_unite_menu_candidates(submenu, sub) abort
    let g:unite_source_menu_menus[a:sub].command_candidates = []
    
    for entry in a:submenu
        let l:str = [
                        \ g:usmm.char.bullet . entry[0],
                        \ empty(entry[1])? '': '[' . entry[1] . ']',
                        \ empty(entry[2])? '': g:usmm.char.key . entry[2]
                    \ ]
        " calculate gap
        let l:gap1 = g:usmm.char.width[0] - strlen(l:str[0])
        let l:gap2 = g:usmm.char.width[1] - strlen(l:str[1].l:str[2].l:gap1)
        
        let l:string = l:str[0].repeat(g:usmm.char.gap, l:gap1).l:str[1].repeat(g:usmm.char.gap, l:gap2).l:str[2]
        call add(g:unite_source_menu_menus[a:sub].command_candidates, [l:string, entry[3]])
    endfor
    return g:unite_source_menu_menus[a:sub].command_candidates
endfunction



let g:unite_source_menu_menus = {}


" -----------------------------------------------------------------------------
" Git commands {{{2
" -----------------------------------------------------------------------------

" list = [ ['desc', 'category', 'key', 'Gstatus'], [...] ]
" render : [ ['› git status       (Fugitive)                      ⌘ ,gs', 'Gstatus'], [...] ]

let g:unite_source_menu_menus.git = {
            \ 'description' : '                SCM git                ⌘ [zone]g',
            \}
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
            \['git prompt  ', 'Fugitive - buff left', '<leader>gi', 'exe "Git! " input("git command: ")'] , 
            \['git cd'      , 'Fugitive'            , ''          , 'Gcd']                                , 
            \]

" 2}}}

" -----------------------------------------------------------------------------
" Common vim commands {{{2
" -----------------------------------------------------------------------------
let g:unite_source_menu_menus.config = {
            \ 'description' : '             Vim Config             ⌘ [zone]c',
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
            \ 'description' : '            NeoBundle              ⌘ [zone]p',
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
            \ 'description' : '             Unite                  ⌘ [zone]p',
            \}
let g:unite_source_menu_menus.unites.command_candidates = [
            \['Buffer list'            , 'Unite', '<C-S-b>', 'Unite buffer']                                       , 
            \['File list (cur. folder)', 'Unite', '<C-S-f>', 'Unite -start-insert file_rec/async']                 , 
            \['File list filtered'     , 'Unite', '<C-S-F>', 'exe "Unite file_rec/async -input=" input("filter: ")'], 
            \['Yank history'           , 'Unite', '<C-y>'  , 'Unite history/yank']                                 , 
            \]
" 2}}}


" Remap {{{2
" ie for 'git' menu : nnoremap <silent>[menu]git :Unite -silent -start-insert menu:git<CR>
function! Create_unite_menu() abort
    for submenu in g:unite_menus
        let l:menu = Populate_unite_menu_candidates(g:unite_source_menu_menus[submenu].command_candidates, submenu)
        execute "nnoremap <silent>[menu]" . submenu . " :Unite -silent -start-insert menu:" . submenu . "<CR>"
    endfor
endfunction
execute Create_unite_menu()
" 2}}}

" 1}}
" vim: foldmethod=marker
