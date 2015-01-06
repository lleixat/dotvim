" Lucius vim color file
" based on Jonathan Filip's <jfilip1024@gmail.com> work
" Version: 5.01

hi clear
if exists("syntax_on")
    syntax reset
endif
let colors_name="lucius"

" TODO Need to add entry for conceal

" = Dark version = {{{1
" == Normal color == {{{2
hi Normal           guifg=#e0e0e0           guibg=#202020
hi Normal           ctermfg=253             ctermbg=234
" }}}

" == Comments == {{{2
hi Comment          guifg=#606060                                   gui=none
hi Comment          ctermfg=240                                     cterm=none
" }}}

" == Constants == {{{2
" any constant
hi Constant         guifg=#70c0d8                                   gui=none
hi Constant         ctermfg=74                                      cterm=none
hi ConstantBold     guifg=#70c0d8                                   gui=bold
hi ConstantBold     ctermfg=74                                      cterm=bold
" strings
hi String           guifg=#80c0d8                                   gui=none
hi String           ctermfg=110                                     cterm=none
" character constant
hi Character        guifg=#80c0d8                                   gui=none
hi Character        ctermfg=110                                     cterm=none
" numbers decimal/hex
hi Number           guifg=#70c0d8                                   gui=none
hi Number           ctermfg=74                                      cterm=none
" true, false
hi Boolean          guifg=#70c0d8                                   gui=none
hi Boolean          ctermfg=74                                      cterm=none
" float
hi Float            guifg=#70c0d8                                   gui=none
hi Float            ctermfg=74                                      cterm=none
" }}}

" == Identifiers == {{{2
" any variable name
hi Identifier       guifg=#86c6b6                                   gui=none
hi Identifier       ctermfg=116                                     cterm=none
hi IdentifierBold   guifg=#86c6b6                                   gui=bold
hi IdentifierBold   ctermfg=116                                     cterm=bold
" function, method, class
hi Function         guifg=#86c6b6                                   gui=none
hi Function         ctermfg=116                                     cterm=none
" }}}

" == Statements == {{{2
" any statement
hi Statement        guifg=#b3d38c                                   gui=none
hi Statement        ctermfg=150                                     cterm=none
hi StatementBold    guifg=#b3d38c                                   gui=bold
hi StatementBold    ctermfg=150                                     cterm=bold
" if, then, else
hi Conditional      guifg=#b3d38c                                   gui=none
hi Conditional      ctermfg=150                                     cterm=none
" try, catch, throw, raise
hi Exception        guifg=#b3d38c                                   gui=none
hi Exception        ctermfg=150                                     cterm=none
" for, while, do
hi Repeat           guifg=#b3d38c                                   gui=none
hi Repeat           ctermfg=150                                     cterm=none
" case, default
hi Label            guifg=#b3d38c                                   gui=none
hi Label            ctermfg=150                                     cterm=none
" sizeof, +, *
hi Operator         guifg=#b3d38c                                   gui=none
hi Operator         ctermfg=150                                     cterm=none
" any other keyword
hi Keyword          guifg=#b3d38c                                   gui=none
hi Keyword          ctermfg=150                                     cterm=none
" }}}

" == Preprocessor == {{{2
" generic preprocessor
hi PreProc          guifg=#e0e8b0                                   gui=none
hi PreProc          ctermfg=187                                     cterm=none
hi PreProcBold      guifg=#e0e8b0                                   gui=bold
hi PreProcBold      ctermfg=187                                     cterm=bold
" #include
hi Include          guifg=#e0e8b0                                   gui=none
hi Include          ctermfg=187                                     cterm=none
" #define
hi Define           guifg=#e0e8b0                                   gui=none
hi Define           ctermfg=187                                     cterm=none
" same as define
hi Macro            guifg=#e0e8b0                                   gui=none
hi Macro            ctermfg=187                                     cterm=none
" #if, #else, #endif
hi PreCondit        guifg=#e0e8b0                                   gui=none
hi PreCondit        ctermfg=187                                     cterm=none
" }}}

" == Types == {{{2
" int, long, char
hi Type             guifg=#90d0a0                                   gui=none
hi Type             ctermfg=115                                     cterm=none
hi TypeBold         guifg=#90d0a0                                   gui=bold
hi TypeBold         ctermfg=115                                     cterm=bold
" static, register, volative
hi StorageClass     guifg=#90d0a0                                   gui=none
hi StorageClass     ctermfg=115                                     cterm=none
" struct, union, enum
hi Structure        guifg=#90d0a0                                   gui=none
hi Structure        ctermfg=115                                     cterm=none
" typedef
hi Typedef          guifg=#90d0a0                                   gui=none
hi Typedef          ctermfg=115                                     cterm=none
" }}}

" == Special == {{{2
" any special symbol
hi Special          guifg=#b0a0c0                                   gui=none
hi Special          ctermfg=182                                     cterm=none
hi SpecialBold      guifg=#b0a0c0                                   gui=bold
hi SpecialBold      ctermfg=182                                     cterm=bold
" special character in a constant
hi SpecialChar      guifg=#b0a0c0                                   gui=none
hi SpecialChar      ctermfg=182                                     cterm=none
" things you can CTRL-]
hi Tag              guifg=#b0a0c0                                   gui=none
hi Tag              ctermfg=182                                     cterm=none
" character that needs attention
hi Delimiter        guifg=#b0a0c0                                   gui=none
hi Delimiter        ctermfg=182                                     cterm=none
" special things inside a comment
hi SpecialComment   guifg=#b0a0c0                                   gui=none
hi SpecialComment   ctermfg=182                                     cterm=none
" debugging statements
hi Debug            guifg=#b0a0c0           guibg=NONE              gui=none
hi Debug            ctermfg=182             ctermbg=NONE            cterm=none
" }}}

" == Text Markup == {{{2
" text that stands out, html links
hi Underlined       guifg=fg                                        gui=underline
hi Underlined       ctermfg=fg                                      cterm=underline
" any erroneous construct
hi Error            guifg=#e37170           guibg=#432323           gui=none
hi Error            ctermfg=167             ctermbg=236            cterm=none
" todo, fixme, note, xxx
hi Todo             guifg=#e0e090           guibg=NONE              gui=underline
hi Todo             ctermfg=186             ctermbg=NONE            cterm=underline
" match parenthesis, brackets
hi MatchParen       guifg=#9F5D5C           guibg=NONE              gui=bold
hi MatchParen       ctermfg=46              ctermbg=NONE            cterm=bold
hi MatchTag         ctermfg=black           ctermbg=244
hi MatchTag         guifg=black             guibg=#8F996B
" the '~' and '@' and showbreak, '>' double wide char doesn't fit on line
hi NonText          guifg=#323240                                   gui=none
hi NonText          ctermfg=238                                     cterm=none
" meta and special keys used with map, unprintable characters
hi SpecialKey       guifg=#323240
"hi SpecialKey       guifg=#757575
hi SpecialKey       ctermfg=239
" titles for output from :set all, :autocmd, etc
hi Title            guifg=#62bdde                                   gui=none
hi Title            ctermfg=74                                      cterm=none
" }}}

" == Ignore == {{{2
" left blank, hidden
hi Ignore           guifg=bg
hi Ignore           ctermfg=bg
" }}}

" == Text Selection == {{{2
" character under the cursor
hi Cursor           guifg=bg                guibg=#a3e3ed
hi Cursor           ctermfg=bg              ctermbg=153
" like cursor, but used when in IME mode
hi CursorIM         guifg=bg                guibg=#96cdcd
hi CursorIM         ctermfg=bg              ctermbg=116
" cursor column
hi CursorColumn     guifg=NONE              guibg=#2F2F2F           gui=none
hi CursorColumn     ctermfg=NONE            ctermbg=236             cterm=none
" cursor line/row
"hi CursorLine       gui=NONE                guibg=#2F2F2F           gui=none
hi CursorLine       guifg=NONE                guibg=#292929           gui=none
hi CursorLine       ctermfg=NONE              ctermbg=236             cterm=none

hi CursorLineNr      guifg=#818698          guibg=#292929           gui=none
hi CursorLineNr      ctermfg=245            ctermbg=236             cterm=none
" visual mode selection
hi Visual           guifg=NONE              guibg=#364458
hi Visual           ctermfg=NONE            ctermbg=24
" visual mode selection when vim is not owning the selection (x11 only)
hi VisualNOS        guifg=fg                                        gui=underline
hi VisualNOS        ctermfg=fg                                      cterm=underline
" highlight incremental search text; also highlight text replaced with :s///c
hi IncSearch        guifg=#66ffff                                   gui=reverse
hi IncSearch        ctermfg=87                                      cterm=reverse
" hlsearch (last search pattern), also used for quickfix
hi Search                                    guibg=#ffaa33          gui=none
hi Search                                    ctermbg=214            cterm=none
" }}}

" == UI == {{{2
" normal item in popup
hi Pmenu            guifg=#e0e0e0           guibg=#303840           gui=none
hi Pmenu            ctermfg=253             ctermbg=233             cterm=none
" selected item in popup
hi PmenuSel         guifg=#cae682           guibg=#505860           gui=none
hi PmenuSel         ctermfg=186             ctermbg=237             cterm=none
" scrollbar in popup
hi PMenuSbar                                guibg=#505860           gui=none
hi PMenuSbar                                ctermbg=59              cterm=none
" thumb of the scrollbar in the popup
hi PMenuThumb                               guibg=#808890           gui=none
hi PMenuThumb                               ctermbg=102             cterm=none
" status line for current window
hi StatusLine       guifg=#e0e0e0           guibg=#363946           gui=bold
hi StatusLine       ctermfg=254             ctermbg=237             cterm=bold
" status line for non-current windows
hi StatusLineNC     guifg=#767986           guibg=#363946           gui=none
hi StatusLineNC     ctermfg=244             ctermbg=237             cterm=none
" tab pages line, not active tab page label
hi TabLine          guifg=#b6bf98           guibg=#363946           gui=none
hi TabLine          ctermfg=244             ctermbg=236             cterm=none
" tab pages line, where there are no labels
hi TabLineFill      guifg=#cfcfaf           guibg=#363946           gui=none
hi TabLineFill      ctermfg=187             ctermbg=236             cterm=none
" tab pages line, active tab page label
hi TabLineSel       guifg=#efefef           guibg=#414658           gui=bold
hi TabLineSel       ctermfg=254             ctermbg=236             cterm=bold
" column separating vertically split windows
hi VertSplit        guifg=#777777           guibg=#363946           gui=none
hi VertSplit        ctermfg=242             ctermbg=237             cterm=none
" line used for closed folds
hi Folded           guifg=#8A9199           guibg=#262628           gui=none
hi Folded           ctermfg=117             ctermbg=235             cterm=none
" column on side used to indicated open and closed folds
hi FoldColumn       guifg=#8A9199           guibg=#363946           gui=none
hi FoldColumn       ctermfg=117             ctermbg=238             cterm=none
" }}}

" == Spelling == {{{2
" word not recognized
hi SpellBad         guisp=#6D2727                                   gui=undercurl
hi SpellBad                                 ctermbg=196             cterm=undercurl
" word not capitalized
hi SpellCap         guisp=#eeee00                                   gui=undercurl
hi SpellCap                                 ctermbg=226             cterm=undercurl
" rare word
hi SpellRare        guisp=#ffa500                                   gui=undercurl
hi SpellRare                                ctermbg=214             cterm=undercurl
" wrong spelling for selected region
hi SpellLocal       guisp=#ffa500                                   gui=undercurl
hi SpellLocal                               ctermbg=214             cterm=undercurl
" }}}

" == Diff == {{{2
" added line
hi DiffAdd          guifg=#80a090           guibg=#313c36           gui=none
hi DiffAdd          ctermfg=fg              ctermbg=22              cterm=none
" changed line
hi DiffChange       guifg=NONE              guibg=#4a343a           gui=none
hi DiffChange       ctermfg=fg              ctermbg=52              cterm=none
" deleted line
hi DiffDelete       guifg=#6c6661           guibg=#3c3631           gui=none
hi DiffDelete       ctermfg=fg              ctermbg=58              cterm=none
" changed text within line
hi DiffText         guifg=#f05060           guibg=#4a343a           gui=bold
hi DiffText         ctermfg=203             ctermbg=52              cterm=bold
" }}}

" == Misc == {{{2
" directory names and other special names in listings
hi Directory        guifg=#c0e0b0                                   gui=none
hi Directory        ctermfg=151                                     cterm=none
" error messages on the command line
hi ErrorMsg         guifg=#BF1E1E           guibg=NONE              gui=none
hi ErrorMsg         ctermfg=196             ctermbg=NONE            cterm=none

" indent guide color
hi IndentGuidesOdd  guifg=#323240           guibg=#212121
hi IndentGuidesOdd  ctermfg=3               ctermbg=3

hi IndentGuidesEven guifg=#323240           guibg=#232323
hi IndentGuidesEven ctermfg=4               ctermbg=4

" columns where signs are displayed (used in IDEs)
hi SignColumn       guifg=#9fafaf           guibg=#181818           gui=none
hi SignColumn       ctermfg=145             ctermbg=233             cterm=none
" Dr Chip's IndGuide
hi HL_IndGuide      guifg=#323240           guibg=#181818           gui=none
hi HL_IndGuide      ctermfg=145             ctermbg=233             cterm=none 

" line numbers
hi LineNr           guifg=#818698           guibg=#363946
hi LineNr           ctermfg=245             ctermbg=237
" the 'more' prompt when output takes more than one line
hi MoreMsg          guifg=#2e8b57                                   gui=none
hi MoreMsg          ctermfg=29                                      cterm=none
" text showing what mode you are in
hi ModeMsg          guifg=#76d5f8           guibg=NONE              gui=none
hi ModeMsg          ctermfg=117             ctermbg=NONE            cterm=none
" the hit-enter prompt (show more output) and yes/no questions
hi Question         guifg=fg                                        gui=none
hi Question         ctermfg=fg                                      cterm=none
" warning messages
hi WarningMsg       guifg=#e5786d                                   gui=none
hi WarningMsg       ctermfg=173                                     cterm=none
" current match in the wildmenu completion
hi WildMenu         guifg=#cae682           guibg=#363946           gui=bold,underline
hi WildMenu         ctermfg=16              ctermbg=186             cterm=bold
" color column highlighting
hi ColorColumn      guifg=NONE              guibg=#1F1F1F           gui=none
hi ColorColumn      ctermfg=NONE            ctermbg=95              cterm=none
" }}}
" 1}}}

" == Vimwiki Colors == {{{
hi link VimwikiHeader1 PreProcBold
hi link VimwikiHeader2 ConstantBold
hi link VimwikiHeader3 StatementBold
hi link VimwikiHeader4 IdentifierBold
hi link VimwikiHeader5 SpecialBold
hi link VimwikiHeader6 TypeBold
" }}}

" == Show Mark == {{{
hi ShowMarksHLl guifg=#363946 guibg=#181818 gui=bold
hi ShowMarksHLo guifg=#363946 guibg=#181818 gui=bold
hi ShowMarksHLu guifg=#363946 guibg=#181818 gui=bold
hi ShowMarksHLm guifg=#363946 guibg=#181818 gui=underline
hi ShowMarksHLm guifg=#363946 guibg=#181818 gui=underline
hi ShowMarksHLm guifg=#363946 guibg=#181818 gui=underline
" }}}

" == Multiple-cursor == {{{
" Default highlighting (see help :highlight and help :highlight-link)
highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
highlight link multiple_cursors_visual Visual
" }}}

" vim: foldmethod=marker
