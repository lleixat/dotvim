let g:tagbar_type_xml = {
            \ 'ctagstype' : 'xml',
            \ 'kinds' : [
            \ 't:tags',
            \ ]
            \ }

let g:tagbar_type_css = {
            \ 'ctagstype' : 'css',
            \ 'kinds' : [
            \ 'c:class',
            \ 'i:id',
            \ 't:tag',
            \ 'd:definition',
            \ 'm:media',
            \ ]
            \ }

let g:tagbar_type_scss = {
            \ 'ctagstype' : 'scss',
            \ 'kinds' : [
            \ 'c:class',
            \ 'i:ids',
            \ 't:tags',
            \ 'd:definition',
            \ ]
            \ }

let g:tagbar_type_sass = {
            \ 'ctagstype' : 'sass',
            \ 'kinds' : [
            \ 'c:class',
            \ 'i:ids',
            \ 't:tags',
            \ 'd:definition',
            \ 'm:media',
            \ 'p:mixin',
            \ ]
            \ }

let g:tagbar_type_snippets = {
            \ 'ctagstype' : 'snippets',
            \ 'kinds' : [
            \ 's:snippets',
            \ ]
            \ }

let g:tagbar_type_markdown = {
            \ 'ctagstype' : 'markdown',
            \ 'kinds' : [
            \ 'h:headings',
            \ 'l:links',
            \ 'i:images'
            \ ],
            \ 'sort' : 0
            \ }

let g:tagbar_type_ansible = {
            \ 'ctagstype' : 'ansible',
            \ 'kinds' : [
            \ 'h:headings',
            \ 'l:links',
            \ 'i:images'
            \ ],
            \ 'sort' : 0
            \ }

let g:tagbar_type_notes = {
            \ 'ctagstype' : 'markdown',
            \ 'kinds' : [
            \ 'h:headings',
            \ 'l:links',
            \ 'i:images'
            \ ],
            \ 'sort' : 0
            \ }

let g:tagbar_type_axciidoc = {
            \ 'ctagstype' : 'markdown',
            \ 'kinds' : [
            \ 'h:headings',
            \ 'l:links',
            \ 'i:images'
            \ ],
            \ 'sort' : 0
            \ }

let g:tagbar_type_php = {
            \ 'ctagstype' : 'php',
            \ 'kinds' : [
            \ 'd:constant',
            \ 'i:interfaces',
            \ 'c:classes',
            \ 'f:function',
            \ ]
            \ }

let g:tagbar_type_sh = {
            \ 'ctagstype' : 'sh',
            \ 'kinds' : [
            \ 'v:Variable declarations:1:0',
            \ 'f:Function',
            \ 'a:Alias',
            \ ]
            \ }

"let g:tagbar_type_javascript = {
            "\ 'ctagstype' : 'javascript',
            "\ 'kinds' : [
            "\ 'a:array',
            "\ 'v:variable',
            "\ 's:string',
            "\ 'o:object',
            "\ 'f:function',
            "\ ],
            "\ 'sort' : 1
            "\ }

"let g:tagbar_type_jpp = {
            "\ 'ctagstype' : 'jpp',
            "\ 'kinds' : [
            "\ 'a:array',
            "\ 'v:variable',
            "\ 's:string',
            "\ 'o:object',
            "\ 'f:function',
            "\ 'e:export',
            "\ 'p:property',
            "\ ]
            "\ }
            "
let g:tagbar_type_vim = {
            \ 'ctagstype' : 'vim',
            \ 'kinds' : [
            \ 't:Coment Bocks',
            \ 'v:variables',
            \ 'f:functions',
            \ 'a:autocommand groups',
            \ 'c:commands',
            \ 'm:maps',
            \ ],
            \ }


"let g:tagbar_type_html = {
            "\ 'ctagstype' : 'html',
            "\ 'kinds' : [
            "\ 'f:JavaScript functions',
            "\ 'a:named anchors',
            "\ 'r:html',
            "\ 'b:body',
            "\ 'o:object',
            "\ 'c:class',
            "\ ],
            "\ 'ctagsargs' : '-f - --html-kinds=fabr'
            "\ }

let g:tagbar_type_ctags = {
            \ 'ctagstype' : 'ctags',
            \ 'kinds' : [
            \ 'e:Glob Exclude:1:0',
            \ 'k:Kinds',
            \ 'd:Lang definitions',
            \ ],
            \ 'sort': 1
            \ }
