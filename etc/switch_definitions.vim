" Switch definitions
let g:switch_no_builtins = 1
let g:switch_definitions = [
            \   {
            \ 	  'true': 'false',
            \ 	  'false': 'null',
            \ 	  'null': 'true',
            \   },
            \   {
            \ 	  '&&': '||',
            \ 	  '||': '&&',
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

autocmd FileType php let b:switch_definitions = [
            \   {
            \ 	  'and': 'or',
            \ 	  'or': 'xor',
            \ 	  'xor': 'and',
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

autocmd FileType laravel,blade let b:switch_definitions = [
            \   {
            \     '@if\s*(\%(true\|false\)\@!\(.*\))': '@if (true || (\1))',
            \     '@if\s*(true || (\(.*\)))': '@if (false && (\1))',
            \     '@if\s*(false && (\(.*\)))': '@if (\1)',
            \   },
            \ ]

autocmd FileType javascript,js let b:switch_definitions = [
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

