" @author  Thomas Lleixa [lex]
" @link    https://github.com/lleixat/dotvim
" @version GIT: $Id$
" @update  GIT: $Date$

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

" -----------------------------------------------------------------------------
" pasting in Chat "{{{
" -----------------------------------------------------------------------------

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

" -----------------------------------------------------------------------------
" To Html improvement"{{{
" -----------------------------------------------------------------------------
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

" -----------------------------------------------------------------------------
" Paste with colorsheme {{{
" -----------------------------------------------------------------------------

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

" -----------------------------------------------------------------------------
" Compte Le nombre de lignes {{{
" -----------------------------------------------------------------------------
command! -range -nargs=0 Lignes :echo <line2> - <line1> + 1
"}}}

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
