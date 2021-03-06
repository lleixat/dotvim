" @author  Thomas Lleixa [lex]
" @link    https://github.com/lleixat/dotvim
" @version GIT: $Id$
" @update  GIT: $Date$

" -----------------------------------------------------------------------------
" FTP {{{
" -----------------------------------------------------------------------------
" cmap <Leader>r :Nread ftp://209.51.134.122/public_html/index.html
" cmap <Leader>w :Nwrite ftp://209.51.134.122/public_html/index.html
" gvim ftp://209.51.134.122/public_html/index.html
" " For ascii file transfers add this:
" let g:netrw_ftpmode="ascii"
let g:hftp="ftp.alwaysdata.com/www/"
let g:rep="/home/lex/Data/www-dev/private/"
function! E_ftp_upload()
    exec ":cd ".g:rep
    let s:fichier=bufname("%")
    exec ":Nwrite ftp://".g:hftp.s:fichier
endfunction map <F8> :call E_ftp_upload()<ENTER> </source>
" }}}

" -----------------------------------------------------------------------------
" Pasting code in Chat {{{
" -----------------------------------------------------------------------------
function! Imcopy() range
    redir @*
    sil echomsg "—8<—". repeat('—', 20)
    sil echomsg expand("%")
    sil echomsg "—8<—". repeat('—', 20)
    exec 'sil!' . a:firstline . ',' . a:lastline . '#'
    redir end
endfunction

com! -range Imcopy <line1>,<line2>call Imcopy()
"}}}

" -----------------------------------------------------------------------------
" Get visual selection {{{
" -----------------------------------------------------------------------------
function! GetVisualSelection()
    " Why is this not a built-in Vim script function?!
    let [lnum1, col1] = getpos("'<")[1:2]
    let [lnum2, col2] = getpos("'>")[1:2]
    let lines     = getline(lnum1, lnum2)
    let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0]  = lines[0][col1 - 1:]
    return join(lines, "\n")

endfunction
com! GetVisualSelection :call GetVisualSelection()
" }}}

" -----------------------------------------------------------------------------
" Pasting code in markdown form {{{
" -----------------------------------------------------------------------------
function! ImcopyMd() range
    "    echom a:firstline ',' a:lastline. '#'
    let l:separator = "```"
    let l:codeStyle = &filetype

    let l:code = GetVisualSelection()
    "let l:code = substitute(l:code, '\n', nr2char(13), 'g')

    let l:snip  = l:separator . l:codeStyle . "\n"
    let l:snip .= l:code . "\n"
    let l:snip .= l:separator . "\n"

    echom l:snip

    " Copying
    redir @*
    sil echomsg l:snip
    redir end
endfunction

com! -range ImcopyMd <line1>,<line2>call ImcopyMd()
"}}}

" -----------------------------------------------------------------------------
" Hastebin {{{
" -----------------------------------------------------------------------------
function! Haste()
    let a:h_srv= $HASTE_SERVER
    exec '%! haste | xclip -f -sel clip'
    echom "Hasted at ".a:h_srv
endfunction

com! -range Haste call Haste()
"}}}

" -----------------------------------------------------------------------------
" Cd-ing in the current file dir {{{
" -----------------------------------------------------------------------------
function! CD()
    exec 'cd %:p:h'
endfunction
com! CD call CD()
"}}}

" -----------------------------------------------------------------------------
" JSON formating {{{
" Note: depends on CPAN JSON::XS
" -----------------------------------------------------------------------------
function! FormatJson()
    exec '%!json_xs -f json -t json-pretty'
endfunction
com! -range FormatJson call FormatJson()
"}}}

" -----------------------------------------------------------------------------
" To Html improvement {{{
" -----------------------------------------------------------------------------
let g:html_diff_one_file = 1

function! DivHtml(line1, line2)
    " make sure to generate in the correct format
    let old_css = 1
    if exists('g:html_use_css')
        let old_css = g:html_use_css
    endif
    let g:html_use_css = 0

    exec a:line1 . ',' . a:line2 . 'TOhtml'
    %g/<style/normal $dgg
    %s/<\/style>\n<\/head>\n//
    %s/.vim_block {/.vim_block {/
    %s/<body\(.*\)>\n/<div class="vim_block"\1>/
    %s/<\/body>\n<\/html>/<\/div>
    %s/<br>//g

    " set nonu
endfunction

command! -range=% DivHtml :call DivHtml(<line1>,<line2>)
" }}}

" -----------------------------------------------------------------------------
" Paste with colorsheme {{{
" -----------------------------------------------------------------------------

function! ForumCopy(line1, line2, scroll)
    " make sure to generate the correct format
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

" -----------------------------------------------------------------------------
" Count lines in current selection {{{
" -----------------------------------------------------------------------------
command! -range -nargs=0 Lignes :echo <line2> - <line1> + 1
" }}}

" ----------------------------------------------------------------------------
" Comment line/block and copy it for edition {{{
" ----------------------------------------------------------------------------
func! Duplicate(line1, line2, ...)
    let comment_string = strlen(&commentstring) > 3 ? '#' : substitute(&commentstring, '\([^ \t]*\)\s*%s.*', '\1', '')
    let lines          = getbufline('%', a:line1, a:line2)

    call inputsave()
    let duplicate_tag_name = input("Enter tag name (default 'tag'): ")
    call inputrestore()

    let tag_string = strlen(duplicate_tag_name) == 0 ? " tag": " ". duplicate_tag_name

    let comments=[]
    for i in lines
        let str = substitute(i, '\(^\s*\)\(.*\)','\1' . comment_string.' \2', '')
        call add(comments, str."    ".comment_string.tag_string)
    endfor
    call append(a:line1-1, comments)

    " valign tags
    "exe ':' . a:line1 . ',' . a:line2 . ' Align .*\zs' . comment_string . tag_string
endf

command! -range Duplicate :call Duplicate(<line1>,<line2>)

vmap <S-Y><S-Y> :Duplicate<CR>
nmap <S-Y><S-Y> :Duplicate<CR>
" }}}

"------------------------------------------------------------------------------
" Retabing and Indenting {{{
" http://vim.wikia.com/wiki/Super_retab
"------------------------------------------------------------------------------

function! TrimSpaces() range
    execute a:line1 . ',' . a:line2 . 's/\s\+$//g'
endfunction
command! -bar -nargs=0 -range=% TrimSpaces <line1>,<line2>call TrimSpaces()

" Return indent (all whitespace at start of a line), converted from
" tabs to spaces if what = 1, or from spaces to tabs otherwise.
" When converting to tabs, result has no redundant spaces.
function! Indenting(indent, what, cols)
    let spccol = repeat(' ', a:cols)
    let result = substitute(a:indent, spccol, '\t', 'g')
    let result = substitute(result, ' \+\ze\t', '', 'g')
    if a:what == 1
        let result = substitute(result, '\t', spccol, 'g')
    endif
    return result
endfunction

" Convert whitespace used for indenting (before first non-whitespace).
" what = 0 (convert spaces to tabs), or 1 (convert tabs to spaces).
" cols = string with number of columns per tab, or empty to use 'tabstop'.
" The cursor position is restored, but the cursor will be in a different
" column when the number of characters in the indent of the line is changed.
function! IndentConvert(bang, line1, line2, what, cols)
    let savepos = getpos('.')
    let cols = empty(a:cols) ? &tabstop : a:cols
    if a:bang == '!'
        " trim spaces and tabs
        execute 'silent!' . a:line1 . ',' . a:line2 . 's/\s\+$//g'
    endif
    execute 'silent!' . a:line1 . ',' . a:line2 . 's/^\s\+/\=Indenting(submatch(0), a:what, cols)/e'
    call histdel('search', -1)
    call setpos('.', savepos)
endfunction

command! -nargs=? -range=% Space2Tab call IndentConvert(<line1>,<line2>,0,<q-args>)
command! -nargs=? -range=% Tab2Space call IndentConvert(<line1>,<line2>,1,<q-args>)
command! -nargs=? -range=% -bang RetabIndent call IndentConvert(<q-bang>, <line1>,<line2>,&et,<q-args>)
"}}}

" ----------------------------------------------------------------------------
" Case String manipulations {{{
" ----------------------------------------------------------------------------
function! Cucfirst(str)
    return substitute(strpart(a:str,0,strlen(a:str)-4), '\w\+', '\u\0', "")
endfunction

function! Clcname(str)
    return substitute(strpart(a:str,0,strlen(a:str)-4), '(\w\+)', '\u\0', "")
endfunction

function! Uppercase(str)
    return substitute(a:str, '(\w\+)', '\u\1', "")
endfunction

function! Lowercase(str)
    return substitute(a:str, '(\w\+)', '\u\0', "")
endfunction

function! Ucfirst(str)
    return substitute(strpart(a:str,0,strlen(a:str)-4), '\w\+', '\u\0', "")
endfunction

com! -nargs=* Cucfirst call Cucfirst(<f-args>)
com! -nargs=* Clcname call Clcname(<f-args>)
com! -nargs=* Uppercase call Uppercase(<f-args>)
com! -nargs=* Lowercase call Lowercase(<f-args>)
com! -nargs=* Ucfirst call Ucfirst(<f-args>)

function! CiFilePos(str)
    if a:str =~ ".\.system.\."
        return '.' . matchstr(a:str, "\/system/.*$")
    elseif a:str =~ ".\.application.\."
        return '.' . matchstr(a:str, "\/application/.*$")
    else
        return a:str
    endif
endfunction
" }}}

" ----------------------------------------------------------------------------
" Do something if current file is in dirname {{{
" ----------------------------------------------------------------------------

com! -nargs=* Iidd call IsInDirDo(<f-args>)
fun! IsInDirDo(dir, do)
    let a:cur_path = expand("%:p:h")

    if a:cur_path =~ a:dir
        "do a:do (dadada)
        echo 'Iidd: exec '.a:do
        exec a:do
    endif
endfun
" }}}

" -----------------------------------------------------------------------------
" Toggle menubar in gvim {{{
" -----------------------------------------------------------------------------
if has('gui_running')
    function! ToggleMenu()
        if &go=~#'m'
            set go-=m
            echom 'Toggle Menu : Off'
        else
            set go+=m
            echom 'Toggle Menu : On'
        endif
    endfunction

    nnoremap <silent> <C-F1> :exec ToggleMenu()<CR>
endif
" }}}

" -----------------------------------------------------------------------------
" Create parent dir on file save {{{
" http://stackoverflow.com/a/4294176
" -----------------------------------------------------------------------------
function! s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction

augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END
" }}}


" -----------------------------------------------------------------------------
" Higlight repeated lines {{{
" http://stackoverflow.com/questions/1268032/marking-duplicate-lines
" -----------------------------------------------------------------------------
function! HighlightRepeats() range
    let lineCounts = {}
    let lineNum = a:firstline
    while lineNum <= a:lastline
        let lineText = getline(lineNum)
        if lineText != ""
            let lineCounts[lineText] = (has_key(lineCounts, lineText) ? lineCounts[lineText] : 0) + 1
        endif
        let lineNum = lineNum + 1
    endwhile
    exe 'syn clear Repeat'
    for lineText in keys(lineCounts)
        if lineCounts[lineText] >= 2
            exe 'syn match Repeat "^' . escape(lineText, '".\^$*[]') . '$"'
        endif
    endfor
endfunction

command! -range=% HighlightRepeats <line1>,<line2>call HighlightRepeats()
" }}}

" -----------------------------------------------------------------------------
" Split/Join {{{
" -----------------------------------------------------------------------------
" Basically this splits the current line into two new ones at the cursor position,
" then joins the second one with whatever comes next.
"
" Example:                      Cursor Here
"                                    |
"                                    V
" foo = ('hello', 'world', 'a', 'b', |'c',
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

" -----------------------------------------------------------------------------
" Redirect vim ex command output in split view
" this function output the result of the Ex command into a split scratch buffer
" http://vim.wikia.com/wiki/Capture_ex_command_output {{{
" -----------------------------------------------------------------------------
function! OutputSplitWindow(...)
    let cmd = join(a:000, ' ')
    let temp_reg = @"
    redir @"
    silent! execute cmd
    redir END
    let output = copy(@")
    let @" = temp_reg
    if empty(output)
        echoerr "no output"
    else
        new
        setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted
        put! =output
    endif
endfunction
command! -nargs=+ -complete=command Output call OutputSplitWindow(<f-args>)
" }}}


" vim: fdm=marker
