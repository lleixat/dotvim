" @author  Thomas Lleixa [lex]
" @link    https://github.com/lleixat/dotvim
" @version GIT: $Id$
" @update  GIT: $Date$
 
 
" -----------------------------------------------------------------------------
" Basics"{{{
" -----------------------------------------------------------------------------
syntax on 
filetype off
filetype plugin on
filetype plugin indent on     " required!
set nocompatible
"set noequalalways " don't auto-resize when a window is closed
set showmatch          " show matching brackets (),{},[]
set lazyredraw
set updatetime=4000
set matchtime=5        " Bracket blinking
set number
set numberwidth=5
set textwidth=80
set colorcolumn=+1
set splitbelow
set splitright
set autowrite
set background=dark
set encoding=utf-8
set termencoding=utf-8
set fillchars=vert:\│

set shell=/bin/zsh
"set autochdir
set complete=k         " global autocompletion
set completeopt+=longest,menuone
"let g:tabular_loaded = 1

set copyindent    " copy the previous indentation on autoindenting

nmap <silent> <leader>ev :e ~/.vim/vimrc<CR>
nmap <silent> <leader>sv :so ~/.vim/vimrc<CR>

noremap <leader><space> :noh<cr>:call clearmatches()<cr>

" Easy filetype switching {{{
nnoremap _md :set ft=markdown<CR>
nnoremap _h  :set ft=xhtml<CR>
nnoremap _p  :set ft=php<CR>
nnoremap _j  :set ft=javascript<CR>
nnoremap _d  :set ft=diff<CR>
" }}}

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Align text
nnoremap <leader>Al :left<cr>
nnoremap <leader>Ac :center<cr>
nnoremap <leader>Ar :right<cr>
vnoremap <leader>Al :left<cr>
vnoremap <leader>Ac :center<cr>
vnoremap <leader>Ar :right<cr>

" Calculator
inoremap <C-C> <C-O>yiW<End>=<C-R>=<C-R>0<CR>

let g:vtranslate = "T"
let g:langpair   = "en"

" Indent hilight
if has('gui_running')
    let g:indent_guides_auto_colors           = 0
    let g:indent_guides_enable_on_vim_startup = 1
endif

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

" -----------------------------------------------------------------------------
" Session settings "{{{
" -----------------------------------------------------------------------------
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize
map <C-Q> :mksession! ~/.vim/.session <cr>
map <C-S> :source ~/.vim/.session <cr>
let g:session_autosave = 'no'

"set noerrorbells
set novb 
set t_vb= " ^


if has('gui_running')
    "let &guicursor = &guicursor . " a:blinkon0 "
    colorscheme lucius
    "set guifont=monospace\ regular\ 10    " :cdefaults
    set guifont=monaco\ regular\ 10    " :cdefaults
    set lines=60                         "lines to display
    set columns=170                      "number of col to display
    set mousemodel=popup
    set go=gmpt
    set anti                            " antialias font
    set cursorline
elseif (&term =~ 'linux')
    set t_co=8
    colorscheme xterm16 
else
    set t_co=256
    set mouse=a
    colorscheme lucius
    set termencoding=utf-8
endif
"}}}

" Set linenums
" -----------------------------------------------------------------------------
if has("autocmd")
	autocmd InsertLeave * :set norelativenumber number
	autocmd InsertEnter * :set nonumber relativenumber
endif


" -----------------------------------------------------------------------------
"  Key binding
" -----------------------------------------------------------------------------

" With Unimpared plugin
" -----------------------------------------------------------------------------
" Bubble single lines
"nmap <C-Up> [e
"nmap <C-Down> ]e
"" Bubble multiple lines
"vmap <C-Up> [egv
"vmap <C-Down> ]egv

" Bubble single lines
nmap <C-Up> ddkP
nmap <C-Down> ddp
" Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]
" Visually select the text that was last edited/pasted
nmap gV `[v`]

" mapleader et added
" -----------------------------------------------------------------------------
let mapleader = ","
let $ADDED = '~/.vim/added/'
if has("win32")
    let $ADDED = $VIM.'/added/'
endif

map <Leader>cd :exe 'cd ' . expand ("%:p:h")<CR>
"equivalent <ctrl a><ctrl C>
map <F8> gg"+yG<CR> 
"}}}

" -----------------------------------------------------------------------------
"  comportement de l'editeur {{{
" -----------------------------------------------------------------------------
 
" Envoyer le curseur sur la ligne suivante/précédente après usage des flèches 
" droite/gauche en bout de ligne :
" -----------------------------------------------------------------------------
set whichwrap=<,>,[,],h,l

" Toujours laisser des lignes visibles (içi 3) au dessus/en dessous du curseur
" quand on atteint le début ou la fin de l'écran :
" -----------------------------------------------------------------------------
set scrolloff=5

" Récupération de la position du curseur entre 2 ouvertures de fichiers
" -----------------------------------------------------------------------------
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" Sudo-write 
" -----------------------------------------------------------------------------
command! W w !sudo tee % > /dev/null

" surlignement des champs à remplir dans les templates
" -----------------------------------------------------------------------------
3match todo /<+.\++>/

" Check syntax mapping
" -----------------------------------------------------------------------------
"map <F2> :CheckSyntax <CR>

"}}}

" Color-Picker"{{{
" -----------------------------------------------------------------------------
map <F2> :ColorVdropper<CR>
map <S-F2> :ColorToggle<CR>
"}}}

" html5 to omnicomplete support "{{{
" -----------------------------------------------------------------------------
let g:event_handler_attributes_complete = 0 " Disable event-handler attributes support
let g:rdfa_attributes_complete          = 0 " Disable event-handler attributes support
let g:microdata_attributes_complete     = 0 " Disable event-handler attributes support
let g:aria_attributes_complete          = 0 " Disable event-handler attributes support
" }}}

" -----------------------------------------------------------------------------
"  Js Indentation for vim-javascript {{{
" -----------------------------------------------------------------------------
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
" }}}

" -----------------------------------------------------------------------------
"  Sparkup {{{
" -----------------------------------------------------------------------------
"let g:sparkup (Default: 'sparkup')
"let g:sparkupArgs (Default: '--no-last-newline')
"let g:sparkupExecuteMapping (Default: '<c-e>')
"let g:sparkupNextMapping (Default: '<c-n>')
"}}}

" ----------------------------------------------------------------------------- 
"  Zencoding
" ----------------------------------------------------------------------------- 
"let g:user_zen_leader_key = '<c-y>'

" -----------------------------------------------------------------------------
" Un petit menu qui permet d'afficher la liste des éléments"{{{
" filtrés avec un wildcard
" -----------------------------------------------------------------------------
set wildmenu
set wildignore=*.o,*#,*~,*.dll,*.so,*.a,*.bak,*.pyc,*.class,*.swp
set wildmode=longest,full
set textwidth=0                         " D'ont wrap lines by default
set backspace=indent,eol,start          " More powerfull backspacing
source $VIMRUNTIME/menu.vim
set cpo-=<
set wcm=<C-Z>
map <F4> :emenu <C-Z>
"}}}

" -----------------------------------------------------------------------------
" Indenting, Folding.."{{{
" -----------------------------------------------------------------------------
"Détection du type de fichier pour l'indentation
if has("autocmd")
  filetype indent on
endif
set tabstop=4     " numbers of spaces of tab character
set shiftwidth=4  " numbers of spaces to (auto)indent
set softtabstop=4 " counts n spaces when DELETE or BCKSPCE is used
set expandtab     " insert spaces instead of tab chars
set autoindent    " always set autoindenting on
set smartindent   " advenced indenting [vs nosmartindent]
"set nosmartindent                              " intelligent indenting -- DEPRECATED by cindent
set nocindent     " set C style indenting off
"set foldenable
set foldmethod=indent


" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za
" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO

" Use ,z to "focus" the current fold.
nnoremap <leader>z zMzvzz
"}}}

" CtrlP {{{
" -----------------------------------------------------------------------------
nmap <c-p> :CtrlP<cr>
"}}}

" Switch {{{
" -----------------------------------------------------------------------------
nnoremap - :Switch<cr>

runtime etc/switch_definitions.vim



"}}}
"
" Marks "{{{
" -----------------------------------------------------------------------------
"let g:showmarks_enable=0
"let g:showmarks_textlower="\t˧"
"}}}

" TabBar "{{{
" -----------------------------------------------------------------------------
let g:Tb_MaxSize      = 1 " I want it to automatically resize if I have buffers
                          " that fill more then one line
let g:Tb_MoreThanOne  = 0 " I want the tabbar to be always visible
let g:Tb_ModSelTarget = 1


" Searching "{{{
" -----------------------------------------------------------------------------
set hlsearch     " highlight all search results
set incsearch    " increment search
set ignorecase   " case-insensitive search
set smartcase    " upper-case sensitive search
"}}}

" Status line "{{{
" -----------------------------------------------------------------------------
set laststatus=2 " occasions to show status line, 2=always.
" set cmdheight=1 " command line height
set ruler        " ruler display in status line
set showmode     " show mode at bottom of screen
" set previewheight=5
"}}}

" Easytags & ctags{{{
" https://github.com/xolox/vim-easytags
" -----------------------------------------------------------------------------
"set tags=./tags
"set tags=./.tags;,~/.vim/mytags
"let g:easytags_auto_update   = 0
"let g:easytags_dynamic_files = 1
"let g:easytags_by_filetype   = '~/.vim/mytags/'
"let g:easytags_on_cursorhold = 1
"let g:easytags_autorecurse   = 1
"}}}

" tags keymap {{{
" -----------------------------------------------------------------------------
map <C-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
set tags=.git/tags
"}}}


" Shell Vim {{{
" https://github.com/xolox/vim-shell
" -----------------------------------------------------------------------------
let g:shell_mappings_enabled = 0
inoremap <Leader>fs <C-o>:Fullscreen<CR>
nnoremap <Leader>fs :Fullscreen<CR>
inoremap <Leader>op <C-o>:Open<CR>
nnoremap <Leader>op :Open<CR>


"}}}

" -----------------------------------------------------------------------------
" delimitmate {{{
" https://github.com/Raimondi/delimitMate/
" -----------------------------------------------------------------------------
let delimitMate_expand_cr = 0


"  }}}

" -----------------------------------------------------------------------------
" TagBar {{{{
" -----------------------------------------------------------------------------

" Set taglist plugin options"{{{
" -----------------------------------------------------------------------------
let Tlist_Sort_Type            = 'name'
let Tlist_Use_Right_Window     = 1
let Tlist_Exit_OnlyWindow      = 1
let Tlist_Enable_Fold_Column   = 0
let Tlist_Compact_Format       = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Inc_Winwidth         = 1
"}}}

" Toggle taglist script"{{{
" -----------------------------------------------------------------------------
map <F7> :TagbarToggle<CR>
let g:tagbar_ctags_bin = "/usr/bin/ctags"
let g:tagbar_iconchars = ['▾', '▸']
let g:tagbar_singleclick = 1

let g:tagbar_type_css = {
\ 'ctagstype' : 'Css',
    \ 'kinds' : [
        \ 'c:classes',
        \ 's:selectors',
        \ 'i:identities'
    \ ]
\ }

let g:tagbar_type_scss = {
\ 'ctagstype' : 'Css',
    \ 'kinds' : [
        \ 'c:classes',
        \ 's:selectors',
        \ 'i:identities'
    \ ]
\ }


"}}}

"}}}} /Tagbar

" -----------------------------------------------------------------------------
"  bufexplorer customisation "{{{
" -----------------------------------------------------------------------------
let g:bufExplorerShowTabBuffer = 1 " Yes.
let g:bufExplorerDefaultHelp   = 0 " Do not show default help
let g:bufExplorerSplitBelow    = 1 " Split new window below current.
let g:bufExplorerSplitRight    = 0 " Split left.
"}}}

" -----------------------------------------------------------------------------
" NERDTree "{{{
" -----------------------------------------------------------------------------

"let loaded_nerd_tree=1
map <F12> :NERDTreeToggle <CR>
let g:NERDTreeShowBookmarks   = 1
let g:NERDTreeHijackNetrw     = 1
let g:NERDTreeMouseMode       = 2
let g:NERDTreeChDirMode       = 1
"let g:NERDTreeShowLineNumbers = 1
let NERDTreeDirArrows         = 1
nnoremap <Leader>f :NERDTreeFind<CR>

" NERDTreeToggle
map <S-F12> :NERDTreeTabsToggle <CR>
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:nerdtree_tabs_autoclose           = 0
let g:nerdtree_tabs_synchronize_view    = 1
let g:nerdtree_tabs_focus_on_files      = 1

"}}}

" netrw"{{{
" -----------------------------------------------------------------------------

" FTP
" -----------------------------------------------------------------------------
" cmap <Leader>r :Nread ftp://209.51.134.122/public_html/index.html
" cmap <Leader>w :Nwrite ftp://209.51.134.122/public_html/index.html
" gvim ftp://209.51.134.122/public_html/index.html
" " For ascii file transfers add the following line to your .vimrc
" let g:netrw_ftpmode="ascii"
let g:hftp="ftp.alwaysdata.com/www/"
let g:rep="/home/lex/Data/www-dev/private/"
function! E_ftp_upload()
    exec ":cd ".g:rep
    let s:fichier=bufname("%")
    exec ":Nwrite ftp://".g:hftp.s:fichier
endfunction map <F8> :call E_ftp_upload()<ENTER> </source>
"}}}

"  Headlights "{{{
" -----------------------------------------------------------------------------
"execute "HeadlightsTurnOn"
"}}}

" show/Hide hidden Chars"{{{
" -----------------------------------------------------------------------------
set nolist " Display unprintable characters f1 - switches
" Unprintable chars mapping
set listchars=tab:ͱ\ ,eol:¶,trail:·,extends:»,precedes:«,nbsp:·
map <silent> <F1> :set invlist<CR>
" I know, <F1> is a very bad idea....
"}}}

" Set bracket matching and comment formats"{{{
" -----------------------------------------------------------------------------
set matchpairs+=<:>
set comments-=s1:/*,mb:*,ex:*/
set comments+=s:/*,mb:**,ex:*/
set comments+=fb:*
set comments+=b:\"
set comments+=n::
"}}}

" Fix filetype detection "{{{
" -----------------------------------------------------------------------------
au BufNewFile,BufRead      .torsmorc* set ft=rc
au BufNewFile,BufRead     *.md        set ft=markdown
au BufNewFile,BufRead     *.mkd       set ft=markdown
au BufNewFile,BufRead     *.inc       set ft=php
"au BufNewFile,BufRead     *.sys       set ft=php
au BufNewFile,BufRead     *.php       set ft=php
au BufNewFile,BufRead  grub.conf      set ft=grub
au BufNewFile,BufRead     *.dentry    set ft=dentry
au BufNewFile,BufRead     *.blog      set ft=blog
au BufNewFile,BufRead     *.xml       set ft=xml
au BufNewFile,BufRead     *.xsl       set ft=xslt
au BufNewFile,BufRead     *.htc       set ft=javascript
au BufNewFile,BufRead     *.snip      set ft=snippet
"au BufNewFile,BufRead     *.scss      set ft=scss.css
au BufNewFile,BufRead jquery-*.js        set ft=javascript syntax=jquery
"}}}                               
                                   
" set up syntax highlighting for e-mail "{{{
" -----------------------------------------------------------------------------
au BufRead,BufNewFile .followup,.article,.letter,/tmp/pico*,nn.*,snd.*,/tmp/mutt* :set ft=mail
"}}}

"Correction ortho"{{{
" -----------------------------------------------------------------------------
augroup filetypedetect
au BufNewFile,BufRead *.html,*.txt,/tmp/pentadactyl* setlocal spell spelllang=fr
"au BufNewFile,BufRead *.php                             setlocal spell spelllang=en
"set hi SpellLocal guifg=none guibg=none gui=none ctermfg=none ctermbg=none
augroup END

"}}}


" -----------------------------------------------------------------------------
" fix ft specific entry "{{{
" -----------------------------------------------------------------------------
" php indent style
au filetype *.php           set noet ci pi sts=0 sw=4 ts=4
au BufRead,BufNewfile *.php set noet ci pi sts=0 sw=4 ts=4

" -----------------------------------------------------------------------------
" tidy depends on CPAN JSON::XS
" -----------------------------------------------------------------------------
map <leader>jt  <Esc>:%!json_xs -f json -t json-pretty<CR>

" actionscript language
" -----------------------------------------------------------------------------
au bufread,bufnewfile *.as set filetype=actionscript
let tlist_actionscript_settings = 'actionscript;c:class;f:method;p:property;v:variable'


" c file specific options
" -----------------------------------------------------------------------------
au filetype c,cpp set cindent
au filetype c,cpp set formatoptions+=ro
 
"}}}

"------------------------------------------------------------------------------
" files search improvement "{{{
"------------------------------------------------------------------------------

"" fuzzy finder
"let g:fuf_modesdisable  = [ 'mrucmd' ]
"let g:fuf_previewheight = 0
"let g:fuf_keyopensplit  = '<a-2>'
"let g:fuf_keyopenvsplit = '<a-3>'

"" xxx: the first line in the assignment
"" below was copied directly from
"" :help g:fuf_file_exclude@en
"let g:fuf_mrufile_exclude =
      "\ '\v\~$|\.(bak|sw[po])$|^(\/\/|\\\\|\/mnt\/|\/media\/)'
      "\ . '|^/tmp/|^/var/tmp/|^\~/tmp/'
      "\ . '|\.git'

"nnoremap <leader>fo :FufFile<enter>
"nnoremap <leader>fb :FufBuffer<enter>
"nnoremap <leader>ft :FufTag<enter>
""}}}

" -----------------------------------------------------------------------------
" xmledit entry "{{{
" -----------------------------------------------------------------------------

"map <leader>x
    "\ :set filetype=xml<cr>
    "\ :source $vimruntime/syntax/xml.vim<cr>
    "\ :set foldmethod=syntax<cr>
    "\ :source $vimruntime/syntax/syntax.vim<cr>
    "\ :source $added/xml.vim<cr>
    ""\ :iunmap <buffer> <leader>.<cr>
    "\ :iunmap <buffer> <leader>><cr>
    "\ :inoremap \> ><cr>
    "\ :echo "xml mode is on"<cr>
    ""  no imaps for <leader>
    ""\:inoremap \. ><cr>

    "" catalog should be set up
    "nmap <leader>l <leader>cd:%w !xmllint --valid --noout -<cr>
    ""nmap <leader>r <leader>cd:%w !rxp -v -n -s -x<cr>
    "nmap <leader>d4 :%w !xmllint --dtdvalid "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd" --noout -<cr>

    "vmap <leader>px !xmllint --format -<cr>
    "nmap <leader>px !!xmllint --format -<cr>
    "nmap <leader>pxa :%!xmllint --format -<cr>

    "nmap <leader>i :%!xsltlint<cr>
"}}}

" -----------------------------------------------------------------------------
" dbext "{{{
" -----------------------------------------------------------------------------
"let g:dbext_default_profile_mysqlserver   = 'type = mysql:user      = root:dbname               = magasin'
"let g:dbext_default_profile_mysql         = 'type = sqlsvr:host     = localhost:bin             = /opt/lampp/bin:user = root:passwd = :extra -t'
let g:dbext_default_profile_localhostMySQL = 'type = MYSQL:MYSQL_bin = /opt/lampp/bin/mysql:user = root:passwd         = toor:dbname = @askdb:extra  = -t'
let g:dbext_default_profile_localmagasin   = 'type = mysql:mysql_bin = /opt/lampp/bin/mysql:user = root:passwd         = :dbname     = magasin:extra = -t'
"let g:dbext_default_type   = 'sqlsvr'
"let g:dbext_default_user   = 'root'
"sqlutilities
let g:sqlutil_align_comma         = 1
let g:sqlutil_align_where         = 1
let g:sqlutil_align_keyword_right = 1
let g:sqlutil_use_tbl_alias       = 'a'
"}}}

"------------------------------------------------------------------------------
" pasting in Chat "{{{
"------------------------------------------------------------------------------

function! Imcopy() range
    redir @*
    sil echomsg "—8<——————————————————————"
    sil echomsg expand("%")
    sil echomsg "—8<——————————————————————"
    exec 'sil!' . a:firstline . ',' . a:lastline . '#'
    redir end
endf

com! -range Imcopy <line1>,<line2>call Imcopy()
"}}}

"------------------------------------------------------------------------------
"To Html improvement"{{{
"------------------------------------------------------------------------------
let g:html_diff_one_file = 1

function! DivHtml(line1, line2)
  " make sure to generate in the correct format
  let old_css = 1
  if exists('g:html_use_css')
    let old_css = g:html_use_css
  endif
  let g:html_use_css = 0

  exec a:line1.','.a:line2.'TOhtml'
  %g/<style/normal $dgg
  %s/<\/style>\n<\/head>\n//
  %s/.vim_block {/.vim_block {/
  %s/<body\(.*\)>\n/<div class="vim_block"\1>/
  %s/<\/body>\n<\/html>/<\/div>
  %s/<br>//g

 " set nonu
endfunction

command! -range=% DivHtml :call DivHtml(<line1>,<line2>)


" Compte Le nombre de lignes
" -----------------------------------------------------------------------------
command! -range -nargs=0 Lignes :echo <line2> - <line1> + 1
"}}}

"------------------------------------------------------------------------------
" Paste with colorsheme {{{
"------------------------------------------------------------------------------

function! ForumCopy(line1, line2, scroll)
    " make sure to generate in the correct format
    let old_css = 1
    if exists('g:html_use_css')
        let old_css = g:html_use_css
    endif
    let g:html_use_css = 0

    " generate...
    exec a:line1.','.a:line2.'TOhtml'
    " ...and delete uneeded lines
    %g/<body/normal k$dgg

    " convert body to a span
    if a:scroll == "true" 
    	%s/<body bgcolor="\s*\([^"]*\)"\s*text=\("[^"]*"\)\s*>/
    				\<span style="display:block; background-color:\1;
    				\ padding:5px; margin:10px; height: 25em; overflow:auto;
    				\ -moz-border-radius:5px; border-radius:5px;" >
    				\<font color=\2>/
	else
	    %s/<body bgcolor="\s*\([^"]*\)"\s*text=\("[^"]*"\)\s*>/
	    			\<span style="display:block; background-color:\1;
	    			\ padding:5px; margin:10px; -moz-border-radius:5px;
	    			\ border-radius:5px;" ><font color=\2>/
    endif
    	%s#</body>\(.\|\n\)*</html>#\='</font></span><br />'#i
    	%s/br>/br \/>/
    " restore old setting
    let g:html_use_css = old_css
endfunction

com! -range=% ForumCopy :call ForumCopy(<line1>,<line2>, "false")
com! -range=% ForumCopyS :call ForumCopy(<line1>,<line2>,"true")
"}}}

" Syntaxe Pour l'édition avec pentadactyl "{{{
" (avec <C-i> dans un champ dans Firefox ) 
" -----------------------------------------------------------------------------
au BufRead,BufNewFile /tmp/pentadactyl* :set ft=xhtml
"}}}

" -----------------------------------------------------------------------------
" Paste entry (old) "{{{
" -----------------------------------------------------------------------------
"
" Nothing to do, i'm currently using |lodgeit.vim|
" :Lodgeit to paste
" :Lodgeit 'url' || #paste to view/edit in [g]vim and :Lodgeit to paste the new
" entry : easyest way...
"}}}


" ----------------------------------------------------------------------------- 
"  Gist plugin "{{{
"  https://github.com/mattn/gist-vim
" ----------------------------------------------------------------------------- 
let g:gist_clip_command            = 'xclip -selection clipboard'
let g:gist_detect_filetype         = 1
let g:gist_open_browser_after_post = 1
let g:gist_show_privates           = 1 " :Gist -l to show private gist repo
let g:gist_private                 = 1
let g:gist_browser_command         = 'firefox --new-tab %URL% &'
let g:github_user                  = $GITHUB_USER
let g:github_token                 = $GITHUB_TOKEN

"}}}

" -----------------------------------------------------------------------------
"  bufexpl "{{{
" -----------------------------------------------------------------------------

map <S-Right> :bnext<CR>
map <S-Left>  :bprevious<CR>

"}}}

"------------------------------------------------------------------------------
"   Yankring"{{{
"------------------------------------------------------------------------------
nnoremap <leader>y :YRShow<CR>

"}}}

"------------------------------------------------------------------------------
"   browse url under cursor "{{{
"------------------------------------------------------------------------------
nnoremap <leader>w :Open<CR>

" }}}

"------------------------------------------------------------------------------
"   gundo "{{{
"------------------------------------------------------------------------------
nnoremap <F6> :GundoToggle<CR>
let g:gundo_width          = 60
let g:gundo_preview_height = 20
"}}}

"------------------------------------------------------------------------------
" 	Custom Align maps
"------------------------------------------------------------------------------
vmap <leader>tp :Align =><CR>

"------------------------------------------------------------------------------
"   Tabular"{{{
"------------------------------------------------------------------------------
"let g:tabular_loaded = 1
"}}}

"------------------------------------------------------------------------------
" Neocomplcache "{{{
"------------------------------------------------------------------------------
let g:neocomplcache_enable_at_startup               = 1   " use neocomplcache.
"let g:neocomplcache_disable_auto_complete          = 1
let g:neocomplcache_enable_smart_case               = 1   " use smartcase.
let g:neocomplcache_enable_camel_case_completion    = 1   " use camel case completion.
let g:neocomplcache_enable_underbar_completion      = 1   " use underbar completion.
let g:neocomplcache_auto_completion_start_length    = 3   " set minimum syntax keyword length.
"let g:neocomplcache_manual_completion_start_length = 3
let g:neocomplcache_lock_buffer_name_pattern        = '\*ku\*'

"" define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'javascript' : $HOME.'/.vim/dictionary/javascript.dict',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'xhtml' : $HOME.'/.vim/dictionary/html.dict',
    \ 'php' : $HOME.'/.vim/dictionary/php.dict'
    \ }

" Enable syntaxcomplete
if has("autocmd") && exists("+omnifunc")
    autocmd Filetype *
                \ if &omnifunc == "" |
                \ setlocal omnifunc=syntaxcomplete#Complete |
                \ endif
endif

    
" define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
"let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
let g:neocomplcache_keyword_patterns['default'] = '$\w+'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
                                       
  
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	return neocomplcache#smart_close_popup() . "\<CR>"
	" For no inserting <CR> key.
	"return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction

""neoSupertab key mapping
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabDefaultCompletionType = "context"
let g:UltiSnipsExpandTrigger="<Tab>"
" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

"--- NeoComplCache PopUp on <tab> --- {{{
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : "\<C-x>\<C-u>"
function! s:check_back_space()
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~ '\s'
endfunction
"}}

" enable heavy omni completion.
"if !exists('g:neocomplcache_omni_patterns')
    "let g:neocomplcache_omni_patterns = {}
"endif
"let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"}}}

" -----------------------------------------------------------------------------
" NeoSnippets & custom snips " {{{
" -----------------------------------------------------------------------------
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/snips'

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_jump)" : "\<TAB>"

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()


" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif


" Add custom coms because thats names sux
command! EditSnips :NeoSnippetEdit

let g:snips_author = $MAIL1

function! Cucfirst(str)
	return substitute(strpart(a:str,0,strlen(a:str)-4), '\w\+', '\u\0', "")
endfunction

function! Uppercase(str)
	return substitute(a:str, '\(\w\)', '\u\1'; '')
endfunction

function! Lowercase(str)
	return substitute(a:str, '(\w\+)', '\u\0', "")
endfunction

function! Ucfisrt(str)
	return substitute(strpart(a:str,0,strlen(a:str)-4), '\w\+', '\u\0', "")
endfunction

function! CiFilePos(str)
  if a:str =~ ".\.system.\."
    return '.' . matchstr(a:str, "\/system/.*$")
  elseif a:str =~ ".\.application.\."
    return '.' . matchstr(a:str, "\/application/.*$")
  else
    return a:str
endfunction

"}}}

"------------------------------------------------------------------------------ 
" PhpDoc
"------------------------------------------------------------------------------ 
let g:pdv_cfg_Type        = "mixed"
let g:pdv_cfg_Author      = $AUTHOR2
let g:pdv_cfg_AuthorLink  = system("echo 'http://'${AUTHOR_LINK} ${AUTHOR_LINK}")
let g:pdv_cfg_Copyright   = system("echo ${COPYL}' 2012-'`date \"+%Y\"`")
let g:pdv_cfg_ReturnVal   = "mixed"
let g:pdv_cfg_Package     = "mybiz"
let g:pdv_cfg_ProjectName = "myBiz"
let g:pdv_cfg_Update      = "GIT: $Date$"
let g:pdv_cfg_Version     = "GIT: $Id$"
nnoremap <C-o> :call PhpDocSingle()<CR>

"------------------------------------------------------------------------------ 
" Try to auto source specific config file when cd-ing in root project dir 
"------------------------------------------------------------------------------ 
let g:auto_source_Appconfig = "appconfig.vim"
function! Appconfig_load()
        if filereadable(g:auto_source_Appconfig)
        exec 'source ' . g:auto_source_Appconfig
        echom "loaded: ".g:auto_source_Appconfig
    endif
endfunction

autocmd VimEnter * :call Appconfig_load()


"------------------------------------------------------------------------------ 
" Re-indent PHP (WIP)
"------------------------------------------------------------------------------ 
function! ReindentPhp()
    " Save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    
    " trim spaces each begin and end of line
    "%s/\(\s*$\)\&\(^\s*\)\&\(^\t*\)//
    " Add <cr> before and after all '{' in ') {'
    %s/\().{\)/)\r{\r/
    " Add <cr> before and after '}' 
    "%s/\(}$\)\&\(^{\)\@!/\r}\r
    
    " do gg=G (reindent all)
    :normal gg=G
    " transform spaces in Tabs 
    exec 'RetabIndent!'
    " add <cr> after } 
    "%s/\(}$\)\&\(}.\r\r\)\@!/\r}\r/
    " restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
    
endfunction
command! -bar -range=% ReindentPhp :call ReindentPhp()

" -----------------------------------------------------------------------------
" Pathogen
" -----------------------------------------------------------------------------
"runtime bundle/vim-pathogen/autoload/pathogen.vim
"call pathogen#infect()
runtime bundle/vim-pathogen/autoload/pathogen.vim
" register bundles found in the runtimepath
let s:bundles    = tr(globpath(&runtimepath, 'bundle/*/.'), "\n", ',')
let s:afters     = tr(globpath(s:bundles, 'after/.'), "\n", ',')
let &runtimepath = join([s:bundles, &runtimepath, s:afters], ',')

" -----------------------------------------------------------------------------
" Tabs
" -----------------------------------------------------------------------------
nmap t :tabnew<CR>
map <C-Right> :tabnext<CR>
map <C-Left> :tabprevious<CR>

set showtabline=2 " always show tabs in gvim, but not vim

" -----------------------------------------------------------------------------
" Auto pairs
" -----------------------------------------------------------------------------
let g:AutoPairsFlyMode = 0

" My tabline function {{{
" -----------------------------------------------------------------------------
set tabline=%!MyTabLine()
function! MyTabLine()
	let s = '' " complete tabline goes here
  	" loop through each tab page
  	for t in range(tabpagenr('$'))
    	" select the highlighting for the buffer names
    	if t + 1 == tabpagenr()
      		let s .= '%#TabLineSel#'
    	else
      		let s .= '%#TabLine#'
    	endif
    	" empty space and dot
    	let s .= ' • '
    	" set the tab page number (for mouse clicks)
    	let s .= '%' . (t + 1) . 'T'
    	" set page number string
    	let s .= t + 1 . ' '
    	" get buffer names and statuses
    	let n = ''  "temp string for buffer names while we loop and check buftype
    	let m = 0 " &modified counter
    	let bc = len(tabpagebuflist(t + 1))  "counter to avoid last ' '
    	
    	" loop through each buffer in a tab
    	for b in tabpagebuflist(t + 1)
      		" bufername : rewrite '*Tagbar*' & 'NerdTree*' to shorten string
      		" buffer types: quickfix gets a [Q], help gets [H]{base fname}
      		" others get 1dir/2dir/3dir/fname shortened to 1/2/3/fname
      		let bn = bufname(b)
      		let bt = getbufvar(b, "&buftype")
      		
      		if bn == '' 
      		    let n .= '[No name]'
            elseif bn =~ 'NERD'
                let n .= '¤'
            elseif bn =~ 'Tagbar'
                let n .= '‹tb›'
            elseif bt == 'help'
                let n .= '[H]' . fnamemodify(bn, ':t:s/.txt$//')
            elseif bt == 'quickfix'
                let n .= '[Q]'
            else
        		let n .= pathshorten(bn)
      		endif
      		
      		" check and ++ tab's &modified count
      		if getbufvar(b, "&modified")
        		let m += 1
      		endif
      		
      		" no final ' ' added...formatting looks better done later
      		if bc > 1
        		let n .= ' '
      		endif
      		
      		let bc -= 1
    	endfor
    	
    	" add modified label [n+] where n pages in tab are modified
    	if m > 0
      		"let s .= '[' . m . '+]'
      		let s.= '+ '
    	endif
    	
    	" add buffer names
    	if n == ''
      		let s .= '[Empty]'
    	else
      		let s .= n
    	endif
    	
    	" switch to no underlining and add final space to buffer list
    	"let s .= '%#TabLineSel#' . ' '
    	let s .= ' '
  	endfor
  	
  	" after the last tab fill with TabLineFill and reset tab page nr
  	let s .= '%#TabLineFill#%T'
  	
  	" right-align the label to close the current tab page
  	if tabpagenr('$') > 1
    	let s .= '%=%#TabLine#%999XX'
  	endif
  	
  	return s
endfunction
"}}}


" Split/Join {{{
"
" Basically this splits the current line into two new ones at the cursor position,
" then joins the second one with whatever comes next.
"
" Example:                      Cursor Here
"                                    |
"                                    V
" foo = ('hello', 'world', 'a', 'b', 'c',
"        'd', 'e')
"
"            becomes
"
" foo = ('hello', 'world', 'a', 'b',
"        'c', 'd', 'e')
"
" Especially useful for adding items in the middle of long lists/tuples in Python
" while maintaining a sane text width.
nnoremap K h/[^ ]<cr>"zd$jyyP^v$h"zpJk:s/\v +$//<cr>:noh<cr>j^
" }}}


" set up the status line
" -
fun! <sid>set_statusline()
    let l:s1="%-3.3n\\ %f\\ %h%m%r%w"
    let l:s2="%{fugitive#statusline()}"
    let l:s3="[%{strlen(&filetype)?&filetype:'?'},%{&encoding},%{&fileformat}]"
    let l:s4="%=\\ 0x%-8b\\ \\ %-14.(%l,%c%V%)\\ %<%p"
    execute "set statusline=" . l:s1 . l:s2 . l:s3 . l:s4
endfun
set laststatus=2
call <sid>set_statusline()

"set statusline=%-3.3n\ %f\ %h%m%r%w%{SL('fugitive#statusline')}[%{strlen(&filetype)?&filetype:'?'},%{&encoding},%{&fileformat}]%{SL('SyntasticStatuslineFlag')}%=\\ 0x%-8b\\ \\ %-14.(%l,%c%V%)\\ %<%p
