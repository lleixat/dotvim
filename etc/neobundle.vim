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

" -----------------------------------------------------------------------------
" Add or remove your Bundles here: {{{1
" -----------------------------------------------------------------------------

" -----------------------------------------------------------------------------
" Global {{{2
" -----------------------------------------------------------------------------
NeoBundle 'Shougo/neocomplete.vim', {
            \ 'depends' : 'Shougo/context_filetype.vim',
            \ 'disabled' : !has('lua'),
            \ 'vim_version' : '7.3.885'
            \ }

" Unite {{{3
" -----------------------------------------------------------------------------
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neoyank.vim'
NeoBundle 'Shougo/unite-outline'
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
"NeoBundle 'SirVer/ultisnips'
NeoBundle 'tobyS/vmustache'

" Git {{{3
" -----------------------------------------------------------------------------
NeoBundle 'gregsexton/gitv'
NeoBundle 'tpope/vim-fugitive'
" 3}}}

"NeoBundle "menghan/CmdlineComplete"
"NeoBundle 'qingxbl/Mark--Karkat'
NeoBundle 'AndrewRadev/linediff.vim'
NeoBundle 'AndrewRadev/switch.vim'
NeoBundle 'chrisbra/unicode.vim'
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
NeoBundle 'bling/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
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
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/gist-vim', {'depends': 'mattn/webapi-vim'}
NeoBundle 'mhinz/vim-startify'
NeoBundle 'mihaifm/vimpanel'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'skroll/Smart-Tabs'
NeoBundle 'szw/vim-bufferlist'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tomtom/quickfixsigns_vim'
NeoBundle 'vim-scripts/Align'
NeoBundle 'vim-scripts/AutoAlign'
NeoBundle 'vim-scripts/FuzzyFinder'
NeoBundle 'vim-scripts/L9'
NeoBundle 'vim-scripts/Tail-Bundle'
NeoBundle 'vim-scripts/The-NERD-Commenter'
NeoBundle 'vim-scripts/boost.vim'
NeoBundle 'vim-scripts/ftpsync'
NeoBundle 'vim-scripts/lua_omni'
NeoBundle 'vim-scripts/mru.vim'
NeoBundle 'vim-scripts/netrw.vim'
NeoBundle 'vim-scripts/repeat.vim'
NeoBundle 'vim-scripts/restart.vim'
NeoBundle 'vim-scripts/surround.vim'
"NeoBundle 'xolox/vim-easytags'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'wincent/ferret', {'depends': 'tpope/vim-dispatch'}
NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-session'
NeoBundle 'xolox/vim-shell'
NeoBundle 'godlygeek/csapprox'
"NeoBundle 'gregsexton/MatchTag'
NeoBundle 'greyblake/vim-preview'
NeoBundle 'honza/vim-snippets'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'sheerun/vim-polyglot'
NeoBundle 'tomtom/checksyntax_vim'
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'jbgutierrez/vim-partial'
NeoBundle 'brooth/far.vim'


" Themes
NeoBundle 'chriskempson/base16-vim'
"NeoBundle 'nanotech/jellybeans.vim'

" Debug
NeoBundle 'joonty/vdebug.git'

" Note taking
NeoBundle 'xolox/vim-notes'
" Remote editing
NeoBundle 'zenbro/mirror.vim'


" NerdTree {{{3
" -----------------------------------------------------------------------------
NeoBundle 'jistr/vim-nerdtree-tabs'
NeoBundle 'scrooloose/nerdtree'
" NeoBundle 'Xuyuanp/nerdtree-git-plugin'
NeoBundle 'vim-scripts/FindInNERDTree'
NeoBundle 'vim-scripts/NERD_tree-Project'
NeoBundle 'tiagofumo/vim-nerdtree-syntax-highlight'
" 3}}}

NeoBundle 'ryanoasis/vim-devicons'
" 2}}} / Global

" -----------------------------------------------------------------------------
" PHP {{{2
" -----------------------------------------------------------------------------
NeoBundleLazy '2072/PHP-Indenting-for-VIm',
            \ {'autoload': {'filetypes': ['php']}}
NeoBundleLazy 'vim-php/vim-php-refactoring',
            \ {'autoload': {'filetypes': ['php']}}
NeoBundleLazy 'lleixat/PDV--phpDocumentor-for-Vim',
            \ {'autoload': {'filetypes': ['php']}}

NeoBundleLazy 'vim-php/tagbar-phpctags.vim',
            \ {'autoload': {'filetypes': ['php']}}
"NeoBundleLazy 'mjoey/vim-magento',
"\ {'autoload': {'filetypes': ['php']}}
"NeoBundleLazy 'shawncplus/phpcomplete.vim',
"           \ {'autoload': {'filetypes': ['php']}}
NeoBundleLazy 'joonty/vim-phpunitqf',
            \ {'autoload': {'filetypes': ['php']}}

"NeoBundleLazy 'tobyS/pdv',
"\ {'autoload': {'filetypes': ['php']}}
"\ {'depends': ['tobyS/vmustache', 'SirVer/ultisnips']},

" Laravel {{{3
NeoBundleLazy 'johnhamelink/blade.vim',
            \ {'autoload': {'filetypes': ['blade']}}
NeoBundleLazy 'kana/vim-gf-user',
            \ {'autoload': {'filetypes': ['php']}}

" 3}}}

" 2}}}

" -----------------------------------------------------------------------------
" Vala {{{2
" -----------------------------------------------------------------------------
" 2}}}

" -----------------------------------------------------------------------------
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
NeoBundleLazy 'rdolgushin/groovy.vim',
            \ {'autoload': {'filetypes': ['groovy']}}
" 2}}}

" -----------------------------------------------------------------------------
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

NeoBundleLazy 'actionshrimp/vim-xpath', {
            \ 'autoload': {'filetypes': ['xml'] }
            \ }

NeoBundleLazy 'fatih/vim-go', {
            \ 'autoload': {'filetypes': ['go'] }
            \ }


" 2}}}

" -----------------------------------------------------------------------------
" Sql {{{2
" -----------------------------------------------------------------------------
NeoBundleLazy 'vim-scripts/dbext.vim',
            \ {'autoload': {'filetypes': ['sql', 'SQL']}}
NeoBundleLazy 'mbra/prettysql',
            \ {'autoload': {'filetypes': ['sql', 'SQL']}}
NeoBundleLazy 'vim-scripts/SQLUtilities',
            \ {'autoload': {'filetypes': ['sql', 'SQL']}}
" 2}}}

" -----------------------------------------------------------------------------
" Markdown {{{2
" -----------------------------------------------------------------------------
NeoBundleLazy 'plasticboy/vim-markdown',
            \ {'autoload': {'filetypes': ['md', 'markdown']}}
NeoBundleLazy 'vim-scripts/SyntaxRange', {
            \ 'depends' : 'vim-scripts/ingo-library',
            \ 'autoload': {'filetypes': ['md', 'markdown', 'adoc']}
            \ }
" 2}}}

" -----------------------------------------------------------------------------
" Ruby {{{2
" -----------------------------------------------------------------------------
NeoBundleLazy 'vim-ruby/vim-ruby'
" 2}}}

" -----------------------------------------------------------------------------
" Various languages {{{2
" -----------------------------------------------------------------------------

" Formaters {{{3
" -----------------------------------------------------------------------------
NeoBundleLazy 'Chiel92/vim-autoformat',
            \ {'autoload': {'filetypes':
            \ ['js', 'json', 'javascript',
            \ 'html', 'xhtml', 'xml',
            \ 'css', 'scss',
            \ 'c', 'css', 'java', 'python',
            \ ]
            \ }}
NeoBundleLazy 'pearofducks/ansible-vim', {
            \ 'autoload': {'filetype': ['yml', 'yaml']}
            \ }

NeoBundleLazy 'stephpy/vim-php-cs-fixer',
            \ {'autoload': {'filetypes': ['php']}}

NeoBundleLazy 'waltzofpearls/vim-phpfmt',
            \ {'autoload': {'filetypes': ['php']}}

NeoBundleLazy 'PProvost/vim-ps1',
            \ {'autoload': {'filetypes': ['ps1']}}
" 3}}}
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
