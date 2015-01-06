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
" }}}

" vim: fdm=marker
