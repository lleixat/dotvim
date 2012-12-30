" Maintainer: Thomas Lleixa <contact@thomaslleixa.fr>
" Based on https://github.com/croaker/mustang-vim
" wich is based on Mustang theme by :
" Henrique C. Alves (hcarvalhoalves@gmail.com)

" Version:     1.0
" Last Change: 12 oct. 2012

set background=dark

hi clear

if exists("syntax_on")
	syntax reset
endif

let colors_name = "mustang-by-me"

" # Vim >= 7.0 specific colors
if version >= 700
	hi CursorLine                   guibg=#2d2d2d ctermbg=236
	hi ColorColumn                  guibg=#2d2d2d ctermbg=236
	hi CursorColumn                 guibg=#2d2d2d ctermbg=236
	hi MatchParen    guifg=#d0ffc0  guibg=#2f2f2f gui=bold ctermfg=157 ctermbg=237 cterm=bold
	hi Pmenu         guifg=#ffffff  guibg=#444444 ctermfg=255 ctermbg=238
	hi PmenuSel      guifg=#000000  guibg=#b1d631 ctermfg=0 ctermbg=148
endif

" # General colors
hi Cursor       guifg=NONE    guibg=#626262 gui=none ctermbg=241
hi Normal       guifg=#e2e2e5 guibg=#202020 gui=none ctermfg=253 ctermbg=234
" the '~' and '@' and showbreak, '>' double wide char doesn't fit on line
hi NonText      guifg=#323240 guibg=#202020 gui=none ctermfg=244 ctermbg=235

" # Indent guide color
hi IndentGuidesOdd  guifg=#323240           guibg=#212121
hi IndentGuidesOdd  ctermfg=3               ctermbg=3
hi IndentGuidesEven guifg=#323240           guibg=#232323
hi IndentGuidesEven ctermfg=4               ctermbg=4

" # columns where signs are displayed (used in IDEs)
hi SignColumn       guifg=#808080           guibg=#060606           gui=none
hi SignColumn       ctermfg=145             ctermbg=233             cterm=none
" # Dr Chip's IndGuide
hi HL_IndGuide      guifg=#323240           guibg=#181818           gui=none
hi HL_IndGuide      ctermfg=145             ctermbg=233             cterm=none

hi LineNr       guifg=#808080 guibg=#060606 gui=none   ctermfg=244 ctermbg=232
hi StatusLine   guifg=#d3d3d5 guibg=#444444 gui=italic ctermfg=253 ctermbg=238 cterm=italic
hi StatusLineNC guifg=#939395 guibg=#444444 gui=none   ctermfg=246 ctermbg=238
hi VertSplit    guifg=#444444 guibg=#444444 gui=none   ctermfg=238 ctermbg=238
hi Folded       guifg=#a0a8b0 guibg=#202020 gui=none   ctermbg=4   ctermfg=248
hi Title        guifg=#f6f3e8 guibg=NONE    gui=bold   ctermfg=254 cterm=bold
hi Visual       guifg=#faf4c6 guibg=#3c414c gui=none   ctermfg=254 ctermbg=4
" meta and special keys used with map, unprintable characters
hi SpecialKey   guifg=#323240 guibg=#202020 gui=none ctermfg=244 ctermbg=236

" # Syntax highlighting
hi Comment    guifg=#808080 gui=italic    ctermfg=244
hi Todo       guifg=#8f8f8f gui=italic    ctermfg=245
hi Boolean    guifg=#b1d631 gui=none      ctermfg=148
hi String     guifg=#b1d631 gui=italic    ctermfg=148
hi Identifier guifg=#b1d631 gui=none      ctermfg=148
hi Function   guifg=#ffffff gui=bold      ctermfg=255
hi Type       guifg=#7e8aa2 gui=none      ctermfg=103
hi Statement  guifg=#7e8aa2 gui=none      ctermfg=103
hi Keyword    guifg=#ff9800 gui=none      ctermfg=208
hi Constant   guifg=#ff9800 gui=none      ctermfg=208
hi Number     guifg=#ff9800 gui=none      ctermfg=208
hi Special    guifg=#ff9800 gui=none      ctermfg=208
hi PreProc    guifg=#faf4c6 gui=none      ctermfg=230
hi Todo       guifg=#060606 guibg=#e6ea50 gui=italic

" == Diff ==
" added line
hi DiffAdd          guifg=#2A330C           guibg=#0A0D00           gui=none
hi DiffAdd          ctermfg=fg              ctermbg=22              cterm=none
" changed line
hi DiffChange       guifg=#6D2C2C           guibg=#0D0202           gui=none
hi DiffChange       ctermfg=fg              ctermbg=52              cterm=none
" deleted line
hi DiffDelete       guifg=#4D2E00           guibg=#1A1207           gui=none
hi DiffDelete       ctermfg=fg              ctermbg=58              cterm=none
" changed text within line
hi DiffText         guifg=#f05060           guibg=#4a343a           gui=bold
hi DiffText         ctermfg=203             ctermbg=52              cterm=bold



" # Code-specific colors
hi pythonOperator guifg=#7e8aa2 gui=none ctermfg=103

" # NERDTree colors
hi NERDTreeFile     guifg=#cdd2db ctermfg=250
hi NERDTreeDir      guifg=#a5aebe ctermfg=111
hi NERDTreeUp       guifg=#5b646d ctermfg=62

hi def link NERDTreeOpenable String
hi def link NERDTreeCloseable NERDTreeOpenable
hi def link NERDTreeCWD String
hi def link NERDTreePart String

" # Show Mark
hi ShowMarksHLo guifg=#232323 guibg=#060606 gui=bold
hi ShowMarksHLu guifg=#232323 guibg=#060606 gui=bold
hi ShowMarksHLl guifg=#232323 guibg=#060606 gui=bold
hi ShowMarksHLm guifg=#232323 guibg=#060606 gui=underline
hi ShowMarksHLm guifg=#232323 guibg=#060606 gui=underline
hi ShowMarksHLm guifg=#232323 guibg=#060606 gui=underline
