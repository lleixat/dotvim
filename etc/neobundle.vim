"NeoBundle Scripts-----------------------------
if has('vim_starting')
    set nocompatible               " Be iMproved

    " Required:
    set runtimepath+=/home/lex/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/home/lex/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here: {{{
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neocomplcache.vim', {'depends' :
		    \ [ 'Shougo/neosnippet.git',
		    \   ['rstacruz/sparkup', {'rtp': 'vim'}],
		    \ ]}

NeoBundle 'Shougo/vimproc.vim', {
            \ 'build' : {
            \     'windows' : 'tools\\update-dll-mingw',
            \     'cygwin' : 'make -f make_cygwin.mak',
            \     'linux' : 'make',
            \    },
            \ }
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kien/ctrlp.vim'

NeoBundle 'bling/vim-airline'
NeoBundle '2072/PHP-Indenting-for-VIm'
NeoBundle 'AndrewRadev/linediff.vim'
NeoBundle 'AndrewRadev/switch.vim'
NeoBundle 'LStinson/vim-project'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'Rykka/colorv.vim'
NeoBundle 'edsono/vim-dbext'
NeoBundle 'godlygeek/csapprox'
NeoBundle 'gregsexton/MatchTag'
NeoBundle 'greyblake/vim-preview'
NeoBundle 'haesken/pentadactyl.vim'
NeoBundle 'honza/vim-snippets'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'jistr/vim-nerdtree-tabs'
NeoBundle 'johnhamelink/blade.vim'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'ervandew/supertab'
NeoBundle 'vim-php/vim-php-refactoring'
NeoBundle 'vim-php/tagbar-phpctags.vim'

NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'juvenn/mustache.vim'
NeoBundle 'kana/vim-textobj-line'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'lilydjwg/colorizer'
NeoBundle 'lleixat/PDV--phpDocumentor-for-Vim'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'mattn/ctrlp-gist'
NeoBundle 'mattn/ctrlp-launcher'
NeoBundle 'mattn/ctrlp-mark'
NeoBundle 'mattn/ctrlp-register'
NeoBundle 'mattn/gist-vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mbra/prettysql'
NeoBundle 'mhinz/vim-startify'
NeoBundle 'mihaifm/vimpanel'
NeoBundle 'myhere/vim-nodejs-complete'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'nelstrom/vim-markdown-preview'
NeoBundle 'othree/fecompressor.vim'
NeoBundle 'othree/html5-syntax.vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'pielgrzym/ctrlp-sessions'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'sgur/ctrlp-extensions.vim'
NeoBundle 'shawncplus/phpcomplete.vim'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'skroll/Smart-Tabs'
NeoBundle 'smith/javaScriptLint.vim'
NeoBundle 'suan/vim-instant-markdown'
NeoBundle 'szw/vim-bufferlist'
NeoBundle 'tacahiroy/ctrlp-funky'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tomtom/checksyntax_vim'
NeoBundle 'tomtom/quickfixsigns_vim'
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'vim-scripts/Align'
NeoBundle 'vim-scripts/AutoAlign'
NeoBundle 'vim-scripts/FindInNERDTree'
NeoBundle 'vim-scripts/FuzzyFinder'
NeoBundle 'vim-scripts/Javascript-syntax-with-Ajax-Support'
NeoBundle 'vim-scripts/L9'
"NeoBundle 'qingxbl/Mark--Karkat'
NeoBundle "menghan/CmdlineComplete"
NeoBundle 'mjoey/vim-magento'
NeoBundle 'vim-scripts/NERD_tree-Project'
NeoBundle 'vim-scripts/SQLUtilities'
NeoBundle 'vim-scripts/The-NERD-Commenter'
NeoBundle 'kshenoy/vim-signature'
NeoBundle 'vim-scripts/YankRing.vim'
NeoBundle 'vim-scripts/ack.vim'
NeoBundle 'vim-scripts/boost.vim'
"NeoBundle 'vim-scripts/bufexplorer.zip'
NeoBundle 'vim-scripts/ftpsync'
NeoBundle 'vim-scripts/jQuery'
NeoBundle 'vim-scripts/lua_omni'
NeoBundle 'vim-scripts/mru.vim'
NeoBundle 'vim-scripts/netrw.vim'
NeoBundle 'vim-scripts/publish.vim'
NeoBundle 'vim-scripts/repeat.vim'
NeoBundle 'vim-scripts/restart.vim'
NeoBundle 'vim-scripts/surround.vim'
NeoBundle 'vim-scripts/vcscommand.vim'
NeoBundle 'vim-scripts/xmledit'
NeoBundle 'xolox/vim-easytags'
NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-session'
NeoBundle 'xolox/vim-shell'
"NeoBundle 'SirVer/ultisnips'
"NeoBundle 'JazzCore/neocomplcache-ultisnips'
NeoBundle 'Valloric/MatchTagAlways'
"NeoBundle 'Valloric/YouCompleteMe', {
            "\ 'build': {
            "\     'linux': './install.sh  --clang-completer',
            "\   },
            "\ }
NeoBundle 'evidens/vim-twig'
NeoBundle 'gregsexton/gitv'
NeoBundle 'guns/xterm-color-table.vim'
NeoBundle 'inkarkat/vim-localrc'
NeoBundle 'jlanzarotta/bufexplorer'
NeoBundle 'joonty/vim-phpunitqf'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'rdnelson/vim-multicursor'
NeoBundle 'sheerun/vim-polyglot'
NeoBundle 'smancill/conky-syntax.vim'
NeoBundle 'tpope/vim-haml'
NeoBundle 'vim-scripts/Tail-Bundle'
NeoBundle 'MattesGroeger/vim-bookmarks'
NeoBundle 'scil/vim-gf-user-laravel'

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell'
" }}}

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

" vim: fdm=marker 
