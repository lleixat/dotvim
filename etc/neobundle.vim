"NeoBundle Scripts-----------------------------
if has('vim_starting')
    set nocompatible               " Be iMproved

    " Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here: {{{1

" Global {{{2
" -----------------------------------------------------------------------------
NeoBundle 'Shougo/neocomplete.vim', {
            \ 'depends' : 'Shougo/context_filetype.vim',
            \ 'disabled' : !has('lua'),
            \ 'vim_version' : '7.3.885'
            \ }

" Unite {{{3
NeoBundle 'Shougo/unite.vim'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'lambdalisue/unite-grep-vcs'
NeoBundle 'tungd/unite-session'
NeoBundleLazy 'heavenshell/unite-zf'
NeoBundleLazy 'heavenshell/unite-sf2'
" 3}}}

NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/vimproc.vim', {
            \ 'build' : {
            \     'windows' : 'tools\\update-dll-mingw',
            \     'cygwin' : 'make -f make_cygwin.mak',
            \     'linux' : 'make',
            \    },
            \ }
"NeoBundle 'Shougo/context_filetype.vim'

" Git {{{3
" -----------------------------------------------------------------------------
NeoBundle 'gregsexton/gitv'
NeoBundle 'tpope/vim-fugitive'
" 3}}}

"NeoBundle "menghan/CmdlineComplete"
"NeoBundle 'qingxbl/Mark--Karkat'
NeoBundle 'AndrewRadev/linediff.vim'
NeoBundle 'AndrewRadev/switch.vim'
NeoBundle 'LStinson/vim-project'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'MattesGroeger/vim-bookmarks'
NeoBundle 'Rykka/colorv.vim'
NeoBundleLazy 'Shougo/vimshell', {
          \ 'depends' : 'Shougo/vimproc.vim',
          \ 'autoload' : {
          \   'commands' : [{ 'name' : 'VimShell',
          \                   'complete' : 'customlist,vimshell#complete'},
          \                 'VimShellExecute', 'VimShellInteractive',
          \                 'VimShellTerminal', 'VimShellPop'],
          \   'mappings' : '<Plug>'
          \ }}
NeoBundle 'Valloric/MatchTagAlways'
NeoBundle 'YankRing.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'guns/xterm-color-table.vim'
NeoBundle 'inkarkat/vim-localrc'
NeoBundle 'jlanzarotta/bufexplorer'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'kana/vim-textobj-line'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kshenoy/vim-signature'
NeoBundle 'lilydjwg/colorizer'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'mattn/gist-vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mhinz/vim-startify'
NeoBundle 'mihaifm/vimpanel'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'skroll/Smart-Tabs'
NeoBundle 'smancill/conky-syntax.vim'
NeoBundle 'szw/vim-bufferlist'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tomtom/quickfixsigns_vim'
NeoBundle 'vim-scripts/Align'
NeoBundle 'vim-scripts/AutoAlign'
NeoBundle 'vim-scripts/FuzzyFinder'
NeoBundle 'vim-scripts/L9'
NeoBundle 'vim-scripts/Tail-Bundle'
NeoBundle 'vim-scripts/The-NERD-Commenter'
NeoBundle 'vim-scripts/ack.vim'
NeoBundle 'vim-scripts/boost.vim'
NeoBundle 'vim-scripts/ftpsync'
NeoBundle 'vim-scripts/lua_omni'
NeoBundle 'vim-scripts/mru.vim'
NeoBundle 'vim-scripts/netrw.vim'
NeoBundle 'vim-scripts/repeat.vim'
NeoBundle 'vim-scripts/restart.vim'
NeoBundle 'vim-scripts/surround.vim'
"NeoBundle 'xolox/vim-easytags'
NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-session'
NeoBundle 'xolox/vim-shell'
NeoBundle 'godlygeek/csapprox'
NeoBundle 'gregsexton/MatchTag'
NeoBundle 'greyblake/vim-preview'
NeoBundle 'haesken/pentadactyl.vim'
NeoBundle 'honza/vim-snippets'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'sheerun/vim-polyglot'
NeoBundle 'tomtom/checksyntax_vim'
NeoBundle 'tomtom/tlib_vim'

" NerdTree {{{3
" -----------------------------------------------------------------------------
NeoBundle 'jistr/vim-nerdtree-tabs'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'vim-scripts/FindInNERDTree'
NeoBundle 'vim-scripts/NERD_tree-Project'
" 3}}}
" 2}}} / Global

" PHP {{{2
" -----------------------------------------------------------------------------
NeoBundleLazy '2072/PHP-Indenting-for-VIm',
            \ {'autoload': {'filetypes': ['php']}}
NeoBundleLazy 'vim-php/vim-php-refactoring',
            \ {'autoload': {'filetypes': ['php']}}
NeoBundleLazy 'lleixat/PDV--phpDocumentor-for-Vim',
            \ {'script_type' : 'ftplugin'}
NeoBundleLazy 'vim-php/tagbar-phpctags.vim',
            \ {'autoload': {'filetypes': ['php']}}
NeoBundleLazy 'mjoey/vim-magento',
            \ {'autoload': {'filetypes': ['php']}}
"NeoBundleLazy 'shawncplus/phpcomplete.vim',
"           \ {'autoload': {'filetypes': ['php']}}
NeoBundleLazy 'joonty/vim-phpunitqf',
            \ {'autoload': {'filetypes': ['php']}}
" Laravel {{{3
NeoBundleLazy 'johnhamelink/blade.vim',
            \ {'autoload': {'filetypes': ['blade']}}
NeoBundleLazy 'scil/vim-gf-user-laravel',
            \ {'autoload': {'filetypes': ['php']}}

" 3}}}

" 2}}}

" Javascript {{{2
" -----------------------------------------------------------------------------
NeoBundleLazy 'kchmck/vim-coffee-script'
NeoBundleLazy 'myhere/vim-nodejs-complete'
NeoBundleLazy 'othree/javascript-libraries-syntax.vim',
            \ {'name': 'js-libs'}
NeoBundleLazy 'vim-scripts/Javascript-syntax-with-Ajax-Support'
NeoBundleLazy 'smith/javaScriptLint.vim'
"NeoBundleLazy 'jelera/vim-javascript-syntax'
"NeoBundleLazy 'vim-scripts/jQuery'
"NeoBundleLazy 'pangloss/vim-javascript'
" 2}}}

" WebFront {{{2
" -----------------------------------------------------------------------------
NeoBundleLazy 'evidens/vim-twig'
NeoBundleLazy 'juvenn/mustache.vim'
NeoBundleLazy 'othree/fecompressor.vim'
NeoBundleLazy 'othree/html5-syntax.vim', {
            \ 'autoload': {'filetypes':
            \ ['htm','phtml','html', 'html5']
            \ }
            \ }
NeoBundleLazy 'mattn/emmet-vim', {
            \ 'autoload':
            \ {'filetypes':
            \ ['xhtml','htm','phtml','html', 'html5', 'xml']
            \ }
            \ }
NeoBundleLazy 'tpope/vim-haml', {
            \ 'autoload': {'filetypes': ['haml'] }
            \ }


" 2}}}

" Sql {{{2
" -----------------------------------------------------------------------------
NeoBundleLazy 'edsono/vim-dbext',
            \ {'autoload': {'filetypes': ['sql', 'SQL']}}
NeoBundleLazy 'mbra/prettysql',
            \ {'autoload': {'filetypes': ['sql', 'SQL']}}
NeoBundleLazy 'vim-scripts/SQLUtilities',
            \ {'autoload': {'filetypes': ['sql', 'SQL']}}
" 2}}}

" Markdown {{{2
" -----------------------------------------------------------------------------
NeoBundleLazy 'plasticboy/vim-markdown',
            \ {'autoload': {'filetypes': ['md', 'markdown']}}
" 2}}}

" Ruby {{{2
" -----------------------------------------------------------------------------
NeoBundleLazy 'vim-ruby/vim-ruby'
" 2}}}

" 1}}}

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

" vim: fdm=marker
