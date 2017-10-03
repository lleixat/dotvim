" @author  Thomas Lleixa [lex]
" @link    https://github.com/lleixat/dotvim
" @version GIT: $Id$
" @update  GIT: $Date$

" Switch definitions
let g:switch_no_builtins = 1

" -----------------------------------------------------------------------------
" Globals custom definitions {{{
" -----------------------------------------------------------------------------
let g:switch_custom_definitions = [
            \   {
            \    'true': 'false',
            \    'false': 'null',
            \    'null': 'true',
            \   },
            \   {
            \     '[oO][nN]': 'off',
            \     '[oO][fF][fF]': 'on',
            \   },
            \   {
            \     'master': 'develop',
            \     'develop': 'integration',
            \     'integration': 'master',
            \   },
            \   {
            \     '[yY][eE][sS]': 'no',
            \     '[nN][oO]': 'yes',
            \   },
            \   {
            \     'pick': 'squash',
            \     'squash': 'reword',
            \     'reword': 'edit',
            \     'edit': 'fixup',
            \     'fixup': 'exec',
            \     'exec': 'pick',
            \   },
            \   {
            \     'present': 'absent',
            \     'absent': 'present',
            \   },
            \   {
            \     'prod': 'preprod',
            \     'preprod': 'dev',
            \     'dev': 'test',
            \     'test': 'prod',
            \   },
            \   {
            \     'production': 'preproduction',
            \     'preproduction': 'qualification',
            \     'qualification': 'integration',
            \     'integration': 'test',
            \     'test': 'development',
            \     'development': 'production',
            \   },
            \   {
            \     'NOTE': 'TODO',
            \     'TODO': 'XXX',
            \     'XXX': 'NOTE',
            \   },
            \   {
            \     '&&': '||',
            \     '||': '&&',
            \   },
            \   {
            \     '\<[a-z0-9]\+_\k\+\>': {
            \       '_\(.\)': '\U\1'
            \     },
            \     '\<[a-z0-9]\+[A-Z]\k\+\>': {
            \       '\([A-Z]\)': '_\l\1'
            \     },
            \   },
            \  {
            \   '\[\s\]': '\[x\]',
            \   '\[x\]': '\[-\]',
            \   '\[-\]': '\[ \]',
            \  },
            \ ]
" }}}

" -----------------------------------------------------------------------------
" [PHP] Definitions {{{
" -----------------------------------------------------------------------------
autocmd FileType php let b:switch_custom_definitions = [
            \   {
            \ 	  'and': 'or',
            \ 	  'or': 'xor',
            \ 	  'xor': 'and',
            \   },
            \   {
            \ 	  'public': 'private',
            \ 	  'private': 'public',
            \   },
            \   {
            \ 	  'include': 'include_once',
            \ 	  'include_once': 'include',
            \   },
            \   {
            \ 	  'require': 'require_once',
            \ 	  'require_once': 'require',
            \   },
            \   {
            \ 	  'mixed': 'string',
            \ 	  'string': 'array',
            \ 	  'array': 'bool',
            \ 	  'bool': 'int',
            \ 	  'int': 'mixed',
            \   },
            \   {
            \ 	  'return': 'echo',
            \ 	  'echo': 'exit',
            \ 	  'exit': 'return',
            \   },
            \   {
            \     '\(\k\+\)\s\+=>': '\1\s:',
            \     '\(\k\+\):': '\1\s=>'
            \   },
            \   {
            \     '$\(\k\+\)\[[''"]\(\k\+\)[''"]\]': '$\1->\2',
            \     '$\(\k\+\)->\(\k\+\)': '$\1[''\2'']'
            \   },
            \   {
            \     '<?php echo \(.\{-}\) ?>': '<?php \1 ?>',
            \     '<?php \%(echo\)\@!\(.\{-}\) ?>': '<?php echo \1 ?>',
            \   },
            \   {
            \     'if\s*(\%(true\|false\)\@!\(.*\))': 'if (true || (\1))',
            \     'if\s*(true || (\(.*\)))': 'if (false && (\1))',
            \     'if\s*(false && (\(.*\)))': 'if (\1)',
            \   },
            \ ]
"}}}

" -----------------------------------------------------------------------------
" [Laravel/Blade] definitions {{{
" -----------------------------------------------------------------------------
autocmd FileType laravel,blade let b:switch_custom_definitions = [
            \   {
            \     '@if\s*(\%(true\|false\)\@!\(.*\))': '@if (true || (\1))',
            \     '@if\s*(true || (\(.*\)))': '@if (false && (\1))',
            \     '@if\s*(false && (\(.*\)))': '@if (\1)',
            \   },
            \ ]
"}}}

" -----------------------------------------------------------------------------
" [Javascript] definitions {{{
" -----------------------------------------------------------------------------
autocmd FileType javascript,js let b:switch_custom_definitions = [
            \   {
            \ 	  'return \(\k\+\)': 'console.log(\1)',
            \ 	  'console.log(\(.*\))': 'return \1'
            \   },
            \   {
            \     '\(\k\+\)\[[''"]\(\k\+\)[''"]\]': '\1.\2',
            \     '\(\k\+\)\.\(\k\+\)': '\1[''\2'']'
            \   },
            \   {
            \     'if\s*(\%(true\|false\)\@!\(.*\))': 'if (true || (\1))',
            \     'if\s*(true || (\(.*\)))': 'if (false && (\1))',
            \     'if\s*(false && (\(.*\)))': 'if (\1)'
            \   },
            \ ]
"}}}


" vim: fdm=marker
