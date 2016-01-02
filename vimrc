" @author  Thomas Lleixa [lex]
" @link    https://github.com/lleixat/dotvim


" -----------------------------------------------------------------------------
" Basics {{{1
" -----------------------------------------------------------------------------
syntax on
filetype off
filetype plugin on
filetype plugin indent on         " required!
set nocompatible
"set noequalalways                " don't auto-resize when a window is closed
set showmatch                     " show matching brackets (),{},[]
set lazyredraw
"set noswapfile
set updatetime=4000
set matchtime=5                   " Bracket blinking
set number
set numberwidth=5
set hidden
let &colorcolumn="80,".join(range(120,300),",")
set textwidth=80
set splitbelow
set splitright
set autowrite
set encoding=utf-8
set termencoding=utf-8
set fillchars=vert:\│
if exists('+breakindent')
    set breakindent
endif

"set shell=/bin/bash\ -i
set shell=/bin/zsh
"set autochdir
set complete=k                    " global autocompletion
set completeopt+=longest,menuone
"let g:tabular_loaded = 1

set copyindent                    " copy the previous indentation on autoindenting

" Quick load vimrc
nmap <silent> <leader>ev :e ~/.vim/vimrc<CR>
nmap <silent> <leader>sv :so ~/.vim/vimrc<CR>

noremap <leader><space> :noh<cr>:call clearmatches()<cr>

" Easy filetype switching {{{2
nnoremap _md :set ft=markdown<CR>
nnoremap _h  :set ft=xhtml.php syn=php<CR>
nnoremap _p  :set ft=php<CR>
nnoremap _j  :set ft=javascript<CR>
nnoremap _d  :set ft=diff<CR>
nnoremap _b  :set ft=php.laravel.blade<CR>
vmap <C-c> "+y
" 2}}}

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

" -----------------------------------------------------------------------------

" Sourcing config files {{{1
" -----------------------------------------------------------------------------
function! Source_conf(dict) abort
    for fpath in a:dict.partials
        let l:file = a:dict.path.fpath.".vim"
        if empty(glob(l:file))
            echoerr 'Source_conf: file `'.l:file.'` does not exists or not readable'
        else
            exec "source " l:file
        endif
    endfor
endfunction

let g:vimconf = {}

" Etc files
let g:vimconf.etc = {
            \ "path": "~/.vim/etc/",
            \ "partials": [
            \     'helpers', 'startify', 'neobundle',
            \     'unite', 'tagbar_types', 'fold'
            \     ],
            \ }
call Source_conf(g:vimconf.etc)

" -----------------------------------------------------------------------------
" Switch {{{
" -----------------------------------------------------------------------------
nnoremap - :Switch<cr>
runtime etc/switch_definitions.vim

" }}}
" 1}}}

" Vim
let g:indentLine_color_term = 239

"GVim
"let g:indentLine_color_gui = '#E3E1DA'
"let g:indentLine_color_dark = '#31353F'

" none X terminal
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)
let g:indentLine_char = '⋮'
" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

" -----------------------------------------------------------------------------
" Session settings {{{
" -----------------------------------------------------------------------------
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize
map <C-Q> :mksession! ~/.vim/sessions/last.vim <cr>

let g:session_autosave = 'yes'
let g:session_autoload = 'no'

"set noerrorbells
set novb
set t_vb= " ^
'

let base16colorspace=256

" -----------------------------------------------------------------------------
" ColorSheme setup {{{2
" -----------------------------------------------------------------------------

" Set default theme
set background=dark
colorscheme base16-ocean
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#2D323D

function! SetIndentLineColor() abort
    if &background ==# "dark"
        exe "hi Conceal guifg='#363D4A'"
    else
        exe "hi Conceal guifg='#F1E9D7'"
    endif
endfunction

command! SetIndentLineColor call SetIndentLineColor()


" Ambienter {{{3
" -----------------------------------------------------------------------------
let g:ambienter_config = {
            \     "debug": 0,
            \     "sensor": {
            \         "value": {"min": 250}
            \     },
            \     "theme": {
            \         "light": {
            \             "background": "light",
            \             "colorsheme": "base16-solarized"
            \         },
            \         "dark": {
            \             "background": "dark",
            \             "colorsheme": "base16-ocean"
            \         }
            \     },
            \     "callbacks": [function("airline#load_theme"), function("SetIndentLineColor")]
            \ }

let g:ambienter_config.sensor.path = "/tmp/bus/iio/devices/als/in_intensity_both_raw"

au VimEnter,BufEnter * call Ambienter.Sensor()
" 3}}}
" 2}}}
" -----------------------------------------------------------------------------


if has('gui_running')
    "let &guicursor = &guicursor . " a:blinkon0 "
    "colorscheme lucius
    set guifont=Inconsolata\ for\ Powerline\ Plus\ Nerd\ File\ Types\ Plus\ Font\ Awesome\ Plus\ Octicons\ Plus\ Pomicons\ 12

    set lines=60                                  " lines to display
    set columns=180                               " number of col to display
    set mousemodel=popup
    set go=gpt
    set anti                                      " antialias font
    set cursorline
    set linespace=3
elseif (&term =~ 'linux')
    "set t_co=8
    colorscheme xterm16
else
    "set t_co=256
    set mouse=a
    set termencoding=utf-8
endif
" }}}

" Set linenums
" -----------------------------------------------------------------------------
if has("autocmd")
    autocmd InsertLeave * :set norelativenumber number
    autocmd InsertEnter * :set nonumber relativenumber
endif


" -----------------------------------------------------------------------------
"  Key binding
" -----------------------------------------------------------------------------

" Block bubbling
" -----------------------------------------------------------------------------
" Move visual block
" Bubble single lines
nmap <C-Up> ddkP
nmap <C-Down> ddp
" Bubble multiple lines and indent
vnoremap <C-Up> :m '<-2<CR>gv=gv
vnoremap <C-Down> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
vnoremap <C-j> :m '>+1<CR>gv=gv
" Indenting
vnoremap <C-Left> <`[V`]
vnoremap <C-Right> >`[V`]
vnoremap <C-h> <`[V`]
vnoremap <C-l> >`[V`]
" Visually select the text that was last edited/pasted
nmap gV `[v`]

" -----------------------------------------------------------------------------
" System Clipboard {{{
" -----------------------------------------------------------------------------
" copy/cut/paste
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa
" }}}

" -----------------------------------------------------------------------------
" Mapleader  added {{{
" -----------------------------------------------------------------------------
let mapleader = ","
map <Leader>cd :exe 'cd '.expand ("%:p:h")<CR>
"equivalent <ctrl a><ctrl C>
map <F8> gg"+yG<CR>
" }}}
" 1}}}
" -----------------------------------------------------------------------------

" -----------------------------------------------------------------------------
" Behaviours {{{
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

" }}}


" -----------------------------------------------------------------------------
" Color-Picker {{{
" https://github.com/Rykka/colorv.vim
" -----------------------------------------------------------------------------
map <F2> :ColorVPicker<CR>
let g:colorizer_startup = 0
map <S-F2> :ColorToggle<CR>
" }}}

" -----------------------------------------------------------------------------
" html5 to omnicomplete support {{{
" -----------------------------------------------------------------------------
let g:event_handler_attributes_complete = 0 " Disable event-handler attributes support
let g:rdfa_attributes_complete          = 0 " Disable event-handler attributes support
let g:microdata_attributes_complete     = 0 " Disable event-handler attributes support
let g:aria_attributes_complete          = 0 " Disable event-handler attributes support
" }}}

" -----------------------------------------------------------------------------
" Js Indentation for vim-javascript {{{
" -----------------------------------------------------------------------------
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1  = "inc"
" }}}

" -----------------------------------------------------------------------------
" Js Context coloring {{{
" https://github.com/bigfish/vim-js-context-coloring
" -----------------------------------------------------------------------------
let g:js_context_colors_enabled = 0 " disable: 0
map <F3> :JSContextColorToggle <CR>
" }}}

" -----------------------------------------------------------------------------
" Zencoding / Emmet {{{
" https://github.com/mattn/emmet-vim
" -----------------------------------------------------------------------------
let g:user_emmet_leader_key = '<c-e>'
" }}}

" -----------------------------------------------------------------------------
" Un petit menu qui permet d'afficher la liste des éléments {{{
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
" }}}

" -----------------------------------------------------------------------------
" Indenting, Folding {{{
" -----------------------------------------------------------------------------
" Détection du type de fichier pour l'indentation
if has("autocmd")
    filetype indent on
endif
set tabstop=4           " numbers of spaces of tab character
set shiftwidth=4        " numbers of spaces to (auto)indent
set softtabstop=4       " counts n spaces when DELETE or BCKSPCE is used
set expandtab           " insert tabs for indent
"set autoindent         " always set autoindenting on
set smartindent         " advenced indenting [vs nosmartindent]
"set nosmartindent      " intelligent indenting -- DEPRECATED by cindent
set cindent             " set C style indenting off

"set foldenable
"set foldcolumn=2
"set foldmethod=indent

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za
" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO

" Use ,z to "focus" the current fold.
nnoremap <leader>z zMzvzz

" }}}

" -----------------------------------------------------------------------------
" Unite {{{1
" -----------------------------------------------------------------------------
" Like ctrlp.vim settings.
call unite#custom#profile('default', 'context', {
            \   'start_insert': 1,
            \   'winheight': 10,
            \   'direction': 'botleft',
            \ })

" Prompt choices.
call unite#custom#profile('default', 'context', {
            \   'prompt': '» ',
            \ })

call unite#filters#matcher_default#use(['matcher_fuzzy'])
" File
nnoremap <C-p> :<C-u>Unite -start-insert buffer file/async:!<CR>
nnoremap <C-P> :<C-u>Unite -start-insert buffer file_rec/async:!<CR>
" Yank
let g:unite_source_history_yank_enable = 1
nnoremap <C-y> :<C-u>Unite -start-insert history/yank<CR>
" Menu
nnoremap <C-m> :<C-u>Unite menu<CR>
" Buffers
nnoremap <C-b> :<C-u>Unite -start-insert buffer<CR>
" Outline
nnoremap <C-h> :<C-u>Unite outline<CR>
" Git grep
nnoremap <C-g> :<C-u>Unite -start-insert grep/git<CR>

" Ag search
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts =
            \ '-i --vimgrep --hidden --ignore ' .
            \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
let g:unite_source_grep_recursive_opt = ''

nnoremap <C-S-f> :<C-u>Unite grep:.<CR>
" 1}}}

" -----------------------------------------------------------------------------
" Yankring {{{
" -----------------------------------------------------------------------------
" Replace conflicted mapping
let g:yankring_replace_n_pkey = ''
let g:yankring_replace_n_nkey = ''
nnoremap <leader>y :YRShow<CR>
" }}}

" -----------------------------------------------------------------------------
" Marks {{{
" -----------------------------------------------------------------------------
let g:showmarks_enable=0
let g:showmarks_textlower="\t˧"
" }}}

" -----------------------------------------------------------------------------
" TabBar {{{
" -----------------------------------------------------------------------------
let g:Tb_MaxSize      = 1  " I want it to automatically resize if I have buffers
" that fill more then one line
let g:Tb_MoreThanOne  = 0  " I want the tabbar to be always visible
let g:Tb_ModSelTarget = 1
" }}}

" -----------------------------------------------------------------------------
" Searching {{{
" -----------------------------------------------------------------------------
set hlsearch     " highlight all search results
set incsearch    " increment search
set ignorecase   " case-insensitive search
set smartcase    " upper-case sensitive search
" }}}

" -----------------------------------------------------------------------------
" Status line {{{
" -----------------------------------------------------------------------------
set laststatus=2       " occasions to show status line, 2=always.
" set cmdheight=1      " command line height
set ruler              " ruler display in status line
set showmode           " show mode at bottom of screen
" set previewheight=5
" }}}

" -----------------------------------------------------------------------------
" Easytags & ctags {{{1
" https://github.com/xolox/vim-easytags
" -----------------------------------------------------------------------------
"set tags=~./tags
set tags=.tags
let g:easytags_auto_update    = 0
"let g:easytags_dynamic_files = 1
let g:easytags_by_filetype   = '~/Dev/.vim/mytags/'
let g:easytags_on_cursorhold = 1
let g:easytags_autorecurse   = 1

" -----------------------------------------------------------------------------
" Tags keymap {{{2
" -----------------------------------------------------------------------------
map <C-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" 2}}}
" 1}}}

" -----------------------------------------------------------------------------
" Shell Vim {{{
" https://github.com/xolox/vim-shell
" -----------------------------------------------------------------------------
let g:shell_mappings_enabled = 0
inoremap <Leader>fs <C-o>:Fullscreen<CR>
nnoremap <Leader>fs :Fullscreen<CR>
inoremap <Leader>op <C-o>:Open<CR>
nnoremap <Leader>op :Open<CR>
" }}}

" -----------------------------------------------------------------------------
" Delimitmate {{{
" https://github.com/Raimondi/delimitMate
" -----------------------------------------------------------------------------
let delimitMate_expand_cr = 0
" }}}

" -----------------------------------------------------------------------------
" TagBar {{{1
" -----------------------------------------------------------------------------
map <F7> :TagbarToggle<CR>
let g:tagbar_ctags_bin   = "/usr/bin/ctags"
let g:tagbar_iconchars   = ['▸', '▾']
let g:tagbar_singleclick = 1

let g:tagbar_phpctags_bin='~/.vim/lib/phpctags/phpctags'
let g:tagbar_phpctags_memory_limit='512M'
" 1}}} /Tagbar

" -----------------------------------------------------------------------------
" Bufexplorer customisation {{{
" -----------------------------------------------------------------------------
let g:bufExplorerShowTabBuffer = 1 " Yes.
let g:bufExplorerDefaultHelp   = 0 " Do not show default help
let g:bufExplorerSplitBelow    = 1 " Split new window below current.
let g:bufExplorerSplitRight    = 0 " Split left.
" }}}

" -----------------------------------------------------------------------------
" NERDTree {{{
" -----------------------------------------------------------------------------

"let loaded_nerd_tree=1
map <S-F12> :NERDTreeToggle <CR>
let g:NERDTreeShowBookmarks   = 1
let g:NERDTreeHijackNetrw     = 1
let g:NERDTreeMouseMode       = 2
let g:NERDTreeChDirMode       = 1
"let g:NERDTreeShowLineNumbers = 1
let NERDTreeDirArrows         = 1
nnoremap <Leader>f :NERDTreeFind<CR>

" NERDTreeToggle
map <F12> :NERDTreeTabsToggle <CR>
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:nerdtree_tabs_autoclose           = 0
let g:nerdtree_tabs_synchronize_view    = 1
let g:nerdtree_tabs_focus_on_files      = 1

" }}}

" -----------------------------------------------------------------------------
" Autoformat {{{
" -----------------------------------------------------------------------------



"  PHP fmt {{{
let g:phpfmt_on_save = get(g:, 'phpfmt_on_save', 0) " format on save (autocmd)
let g:phpfmt_php_path = "/usr/bin/php"              " Path to PHP
let g:phpfmt_prepasses_list = "AutoPreincrement,JointToImplode,DoubleToSingleQuote"
let g:phpfmt_passes_list = "ReturnNull"
let g:phpfmt_config='~/.vim/etc/phptools.rc'
"let g:phpfmt_exclude_list = "vendor,cache"
let g:phpfmt_enable_default_mapping = 0
let g:phpfmt_psr2 = 1

au FileType php nnoremap <silent><C-l><C-f> :call PhpFmtFixFile()<CR>
au FileType php nnoremap <silent><C-l><C-d> :call PhpFmtFixDirectory()<CR>
" }}}

"  Autoformat {{{
let g:formaters_args_javascript = "-ajxk"
let g:formaters_args_css        = "-ajxk -w 120"
"let g:formatprg_args_php = "--mode=cs --style=ansi -pcHs4"

" Reformat mapping
nnoremap <silent><C-l><C-l> :Autoformat<CR>

" }}}
" -----------------------------------------------------------------------------
" }}}

" -----------------------------------------------------------------------------
" netrw {{{
" -----------------------------------------------------------------------------
cabbrev ss VimpanelSessionMake
cabbrev sl VimpanelSessionLoad
cabbrev vp Vimpanel
cabbrev vl VimpanelLoad
cabbrev vc VimpanelCreate
cabbrev ve VimpanelEdit
cabbrev vr VimpanelRemove
" }}}

" -----------------------------------------------------------------------------
" Show/Hide hidden Chars {{{
" -----------------------------------------------------------------------------
set nolist " Display unprintable characters f1 - switches
" Unprintable chars mapping
set listchars=tab:ͱ\ ,eol:¶,trail:·,extends:»,precedes:«,nbsp:·
" I know, <F1> is a very bad idea....
map <silent> <F1> :set invlist<CR>
" }}}

" -----------------------------------------------------------------------------
" Set bracket matching and comment formats {{{
" -----------------------------------------------------------------------------
set matchpairs+=<:>
set comments-=s1:/*,mb:*,ex:*/
set comments+=s:/*,mb:**,ex:*/
set comments+=fb:*
set comments+=b:\"
set comments+=n::
" }}}

" -----------------------------------------------------------------------------
" Fix filetype detection {{{
" -----------------------------------------------------------------------------
au BufNewFile,BufRead        .torsmorc* set ft=rc
au BufNewFile,BufRead       *.html      set ft=javascript syn=html
au BufNewFile,BufRead       *.coffee    set ft=coffee
au BufNewFile,BufRead       *.mustache  set ft=mustache
au BufNewFile,BufRead       *.md        set ft=markdown
au BufNewFile,BufRead       *.mkd       set ft=markdown
au BufNewFile,BufRead       *.inc       set ft=php
"au BufNewFile,BufRead      *.sys       set ft=php
au BufNewFile,BufRead        *.php      set ft=php
au BufNewFile,BufRead     grub.conf     set ft=grub
au BufNewFile,BufRead        *.dentry   set ft=dentry
au BufNewFile,BufRead        *.blog     set ft=blog
au BufNewFile,BufRead        *.xml      set ft=xml
au BufNewFile,BufRead        *.xsl      set ft=xslt
au BufNewFile,BufRead        *.htc      set ft=javascript
au BufNewFile,BufRead        *.snip     set ft=snippet
"au BufNewFile,BufRead      *.scss      set ft=scss.css
au BufNewFile,BufRead jquery-*.js       set ft=javascript syntax=jquery
au BufNewFile,BufRead         .ctags    set ft=ctags syntax=ctags
" }}}


" -----------------------------------------------------------------------------
" Golang {{{
" -----------------------------------------------------------------------------
let g:go_highlight_functions         = 1
let g:go_highlight_methods           = 1
let g:go_highlight_structs           = 1
let g:go_highlight_operators         = 1
let g:go_highlight_build_constraints = 1
let g:go_bin_path                    = "/home/lex/go/go/bin/"
" }}}
" -----------------------------------------------------------------------------
" Set up syntax highlighting for e-mail {{{
" -----------------------------------------------------------------------------
au BufRead,BufNewFile .followup,.article,.letter,/tmp/pico*,nn.*,snd.*,/tmp/mutt* :set ft=mail
" }}}

" -----------------------------------------------------------------------------
" Correction ortho {{{
" -----------------------------------------------------------------------------
augroup filetypedetect
    au BufNewFile,BufRead *.html,*.txt,/tmp/pentadactyl* setlocal spell spelllang=fr
    "au BufNewFile,BufRead *.php                             setlocal spell spelllang=en
    "set hi SpellLocal guifg=none guibg=none gui=none ctermfg=none ctermbg=none
augroup END
" }}}

" }}}
" -----------------------------------------------------------------------------

" Filetype specific entry {{{1
" -----------------------------------------------------------------------------
" php indent style
au filetype *.php           set noet ci pi sts=0 sw=4 ts=4
au BufRead,BufNewfile *.php set noet ci pi sts=0 sw=4 ts=4

" c,cpp file specific options {{{2
" -----------------------------------------------------------------------------
au filetype c,cpp set cindent
au filetype c,cpp set formatoptions+=ro
" 2}}}
" 1}}}

" -----------------------------------------------------------------------------
" dbext {{{
" -----------------------------------------------------------------------------
" You need to put your specific config in .appconfig file lke this:
"let g:dbext_default_profile_localhostMySQL = 'type = MYSQL:MYSQL_bin = /usr/bin/mysql:user = root:passwd= toor:dbname = @askdb:extra  = -t'
let g:dbext_default_type   = 'MYSQL'
let g:dbext_default_user   = 'root'
let g:dbext_default_dbname = '@askdb'

"sqlutilities
let g:sqlutil_align_comma         = 1
let g:sqlutil_align_where         = 1
let g:sqlutil_align_keyword_right = 1
let g:sqlutil_use_tbl_alias       = 'a'
" }}}

" -----------------------------------------------------------------------------
" Pentadactyl textarea edition syntax support {{{
" ('<C-i>' stuff in firefox textarea
" -----------------------------------------------------------------------------
au BufRead,BufNewFile /tmp/pentadactyl* :set ft=xhtml
" }}}

" -----------------------------------------------------------------------------
" Gist plugin {{{
" https://github.com/mattn/gist-vim
" -----------------------------------------------------------------------------
let g:gist_clip_command            = 'xclip -selection clipboard'
let g:gist_detect_filetype         = 1
let g:gist_open_browser_after_post = 1
let g:gist_show_privates           = 1 " :Gist -l to show private gist repo
let g:gist_private                 = 1
let g:gist_browser_command         = '$BROWSER --new-tab %URL% &'
let g:github_user                  = $GITHUB_USER
let g:github_token                 = $GITHUB_TOKEN

" }}}

" -----------------------------------------------------------------------------
" Bufexpl {{{
" -----------------------------------------------------------------------------
map <S-Right> :bnext<CR>
map <S-Left>  :bprevious<CR>
" }}}

" ------------------------------------------------------------------------------
" NerdCommenter {{{
" ------------------------------------------------------------------------------
" Toggle comments
nnoremap ,c :call NERDComment(0, "toggle")<CR>
vnoremap ,c :call NERDComment(1, "toggle")<CR>
" }}}
"------------------------------------------------------------------------------

"------------------------------------------------------------------------------
" Surround mapping {{{
"------------------------------------------------------------------------------
function! Map_surroundchars() abort
    let surround_chars = ['"', '`', '(', '[', '{', '<', "'"]
    for char in surround_chars
        " Surround
        execute 'nmap <C-s><C-s>' . char . ' viwS' . char . 'lvi' . char
    endfor
    " Delete surrounding char
    execute 'nmap <C-s><C-d> ds'
    " Change surrounding char
    execute 'nmap <C-s><C-c> cs'
endfunction
execute Map_surroundchars()

" }}}

"------------------------------------------------------------------------------
" Browse url under cursor {{{
"------------------------------------------------------------------------------
nnoremap <leader>w :Open<CR>
" }}}

" -----------------------------------------------------------------------------
" Vim notes {{{2
" -----------------------------------------------------------------------------
"  https://github.com/xolox/vim-notes 
let g:notes_directories = ['~/Documents/Notes', '~/Dropbox/Shared Notes']
" 2}}}
" -----------------------------------------------------------------------------

"------------------------------------------------------------------------------
" Gundo {{{
"------------------------------------------------------------------------------
nnoremap <F6> :GundoToggle<CR>
let g:gundo_width          = 60
let g:gundo_preview_height = 20
" }}}

" -----------------------------------------------------------------------------
" Custom Align maps {{{1
" -----------------------------------------------------------------------------
vmap <leader>tp :Align =><CR>
vmap <leader>t" :Align \s"<CR>

" -----------------------------------------------------------------------------
" Easy align {{{2
" -----------------------------------------------------------------------------
" git://github.com/junegunn/vim-easy-align.git
vnoremap <silent> <Enter> :EasyAlign<CR>
let g:easy_align_delimiters = {
            \ '>': { 'pattern': '>>\|=>\|>' },
            \ '/': { 'pattern': '//*' },
            \ '"': { 'pattern': '\s"' },
            \ 'x': {
            \     'pattern':       '[xX]',
            \     'margin_left':   ' <<<',
            \     'margin_right':  '>>> ',
            \     'stick_to_left': 0
            \   }
            \ }
" 2}}}
" 1}}}

" -----------------------------------------------------------------------------
" Neocomplete {{{1
" -----------------------------------------------------------------------------
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 0
let g:neocomplete#enable_auto_delimiter = 1

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
            \ 'default' : '',
            \ 'vimshell' : $HOME.'/.vimshell_hist'
            \ }
"\ 'scheme' : $HOME.'/.gosh_completions'

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return neocomplete#close_popup() . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <Tab>: completion.
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<Tab>"
inoremap <expr><Tab> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<Tab>" : neocomplete#start_manual_complete()
function! s:check_back_space()
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplete#close_popup()
inoremap <expr><C-e> neocomplete#cancel_popup()

" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'


" -----------------------------------------------------------------------------
" NeoSnippets & custom snips {{{2
" -----------------------------------------------------------------------------
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/snips'
"let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets/'

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><Tab> neosnippet#expandable_or_jumpable() ?  "\<Plug>(neosnippet_expand_or_jump)": pumvisible() ? "\<C-n>" : "\<Tab>"
"smap <expr><Tab> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)": "\<Tab>"

"set completeopt-=preview

" Add custom coms because thats names sux
com! EditSnips :NeoSnippetEdit

let g:snips_author = $MAIL1
"}}}
" 2}}}

"------------------------------------------------------------------------------
" Unltisnips  {{{2
"------------------------------------------------------------------------------
"" Configure Ultisnips
"let g:UltiSnipsExpandTrigger = "<Tab>"
"let g:UltiSnipsListSnippets = "<M-Tab>"
"" Set a custom snippets directory
"let g:UltiSnipsSnippetsDir = $HOME . "/.vim/etc/ultisnips/"
"let g:UltiSnipsSnippetDirectories = ["ultisnips"]
"" 2}}}


" 1}}}

"------------------------------------------------------------------------------
" Match Tag Always {{{
"------------------------------------------------------------------------------
let g:mta_filetypes = {
            \ 'html' : 1,
            \ 'xhtml' : 1,
            \ 'xml' : 1,
            \ 'jinja' : 1,
            \}

"let g:mta_use_matchparen_group = 0
"let g:mta_set_default_matchtag_color = 0
"highlight MatchTag ctermfg=black ctermbg=lightgreen guifg=#2B303B guibg=#EBCB8B

" }}}

"------------------------------------------------------------------------------
" PhpDoc {{{
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
autocmd FileType php nnoremap <C-o> :call PhpDocSingle()<CR>

"let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
"nnoremap <buffer> <C-i> :call pdv#DocumentCurrentLine()<CR>
" }}}

"------------------------------------------------------------------------------
" Localrc filename {{{
"------------------------------------------------------------------------------
let g:localrc_filename = ".appconfig.vim"
" }}}

" -----------------------------------------------------------------------------
" Tabs navigation {{{
" -----------------------------------------------------------------------------
nmap t :tabnew<CR>
nmap <C-Right> :tabnext<CR>
nmap <C-Left> :tabprevious<CR>

set showtabline=2 " always show tabs in gvim, but not vim
" }}}

" -----------------------------------------------------------------------------
" Auto pairs {{{
" -----------------------------------------------------------------------------
let g:AutoPairsFlyMode = 0
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`'}
let g:AutoPairShortcutFastWrap = '<C-e>'
au Filetype twig let b:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`', "%":"%"}
" }}}

" -----------------------------------------------------------------------------
" Multiple Cursor {{{
" https://github.com/terryma/vim-multiple-cursors
" -----------------------------------------------------------------------------
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_next_key='<C-j>'
let g:multi_cursor_prev_key='<C-h>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
" }}}


" -----------------------------------------------------------------------------
" Airline {{{
" -----------------------------------------------------------------------------
let g:airline_powerline_fonts = 1
" }}}


" vim: fdm=marker
