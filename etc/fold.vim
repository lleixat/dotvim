" -----------------------------------------------------------------------------
" Custom fold text {{{
" -----------------------------------------------------------------------------
function! CustomFoldText()
    "get first non-blank line
    let fs = v:foldstart
    while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
    endwhile
    if fs > v:foldend
        let line = getline(v:foldstart)
    else
        let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
    endif

    let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
    let foldStartStr    = repeat('▾ ', v:foldlevel) . repeat('—', 5)
    let foldSize        = 1 + v:foldend - v:foldstart
    let foldSizeStr     = foldSize . " lines "
    let foldLevelStr    = repeat('—', 5) . repeat(' ▾', v:foldlevel)
    let lineCount       = line("$")
    let foldPercentage  = printf("[%.1f", (foldSize*1.0)/lineCount*100) . "%] "
    let foldGapStr      = repeat(' ', (27 - strwidth(foldSizeStr.foldLevelStr.foldPercentage)))
    let expansionString = repeat(' ', w - strwidth(foldStartStr.foldGapStr.foldSizeStr.line.foldLevelStr.foldPercentage))
    return line . expansionString . foldStartStr . foldGapStr . foldSizeStr . foldPercentage . foldLevelStr
endfunction

set foldtext=CustomFoldText()
" }}}

"vim: set foldmethod=marker
