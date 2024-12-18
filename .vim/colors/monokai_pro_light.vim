" Monokai Pro Light
set background=light
highlight clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="monokai_pro_light"

" Convert hex to term256
let s:white = '#faf4f2'       " bg
let s:grey = '#a59f9b'        " comment grey
let s:black = '#29242b'       " fg
let s:red = '#e14774'         " #e14774
let s:green = '#269d3d'       " #269d3d
let s:yellow = '#cc7a0a'      " #cc7a0a
let s:orange = '#e16032'      " #e16032
let s:purple = '#705abe'      " #705abe
let s:cyan = '#1c8ca8'        " #1c8ca8
let s:selection = '#bfb9b6'   " selection grey

" Basic syntax groups
hi Comment          guifg=#a59f9b guibg=NONE gui=italic       ctermfg=247 ctermbg=NONE cterm=NONE
hi Constant         guifg=#e16032 guibg=NONE gui=NONE         ctermfg=166 ctermbg=NONE
hi String          guifg=#269d3d guibg=NONE gui=NONE          ctermfg=28  ctermbg=NONE
hi Character       guifg=#269d3d guibg=NONE gui=NONE          ctermfg=28  ctermbg=NONE
hi Number          guifg=#e16032 guibg=NONE gui=NONE          ctermfg=166 ctermbg=NONE
hi Boolean         guifg=#e16032 guibg=NONE gui=NONE          ctermfg=166 ctermbg=NONE
hi Float           guifg=#e16032 guibg=NONE gui=NONE          ctermfg=166 ctermbg=NONE
hi Identifier      guifg=#1c8ca8 guibg=NONE gui=NONE          ctermfg=31  ctermbg=NONE
hi Function        guifg=#cc7a0a guibg=NONE gui=NONE          ctermfg=172 ctermbg=NONE
hi Statement       guifg=#e14774 guibg=NONE gui=NONE          ctermfg=161 ctermbg=NONE
hi Conditional     guifg=#e14774 guibg=NONE gui=NONE          ctermfg=161 ctermbg=NONE
hi Repeat          guifg=#e14774 guibg=NONE gui=NONE          ctermfg=161 ctermbg=NONE
hi Label           guifg=#cc7a0a guibg=NONE gui=NONE          ctermfg=172 ctermbg=NONE
hi Operator        guifg=#e14774 guibg=NONE gui=NONE          ctermfg=161 ctermbg=NONE
hi Keyword         guifg=#e14774 guibg=NONE gui=NONE          ctermfg=161 ctermbg=NONE
hi Exception       guifg=#e14774 guibg=NONE gui=NONE          ctermfg=161 ctermbg=NONE
hi PreProc         guifg=#cc7a0a guibg=NONE gui=NONE          ctermfg=172 ctermbg=NONE
hi Include         guifg=#e14774 guibg=NONE gui=NONE          ctermfg=161 ctermbg=NONE
hi Define          guifg=#e14774 guibg=NONE gui=NONE          ctermfg=161 ctermbg=NONE
hi Macro           guifg=#cc7a0a guibg=NONE gui=NONE          ctermfg=172 ctermbg=NONE
hi PreCondit       guifg=#269d3d guibg=NONE gui=NONE          ctermfg=28  ctermbg=NONE
hi Type            guifg=#269d3d guibg=NONE gui=NONE          ctermfg=28  ctermbg=NONE
hi StorageClass    guifg=#cc7a0a guibg=NONE gui=NONE          ctermfg=172 ctermbg=NONE
hi Structure       guifg=#cc7a0a guibg=NONE gui=NONE          ctermfg=172 ctermbg=NONE
hi Typedef         guifg=#cc7a0a guibg=NONE gui=NONE          ctermfg=172 ctermbg=NONE
hi Special         guifg=#e16032 guibg=NONE gui=NONE          ctermfg=166 ctermbg=NONE
hi SpecialChar     guifg=#e16032 guibg=NONE gui=NONE          ctermfg=166 ctermbg=NONE
hi Tag             guifg=#e14774 guibg=NONE gui=NONE          ctermfg=161 ctermbg=NONE
hi Delimiter       guifg=#e14774 guibg=NONE gui=NONE          ctermfg=161 ctermbg=NONE
hi SpecialComment  guifg=#a59f9b guibg=NONE gui=NONE          ctermfg=247 ctermbg=NONE
hi Debug           guifg=#e14774 guibg=NONE gui=NONE          ctermfg=161 ctermbg=NONE
hi Underlined      guifg=#1c8ca8 guibg=NONE gui=underline     ctermfg=31  ctermbg=NONE cterm=underline
hi Ignore          guifg=#a59f9b guibg=NONE gui=NONE          ctermfg=247 ctermbg=NONE
hi Error           guifg=#e14774 guibg=NONE gui=NONE          ctermfg=161 ctermbg=NONE
hi Todo            guifg=#cc7a0a guibg=NONE gui=bold,italic   ctermfg=172 ctermbg=NONE cterm=bold

" Editor UI
hi ColorColumn     guifg=NONE    guibg=#bfb9b6 gui=NONE       ctermfg=NONE ctermbg=250
hi Cursor          guifg=#faf4f2 guibg=#705abe gui=NONE       ctermfg=255  ctermbg=97
hi CursorColumn    guifg=NONE    guibg=#bfb9b6 gui=NONE       ctermfg=NONE ctermbg=250
hi CursorLine      guifg=NONE    guibg=NONE gui=NONE       ctermfg=NONE ctermbg=NONE cterm=NONE
hi Directory       guifg=#e14774 guibg=NONE    gui=NONE       ctermfg=161  ctermbg=NONE
hi DiffAdd         guifg=#269d3d guibg=#bfb9b6 gui=NONE       ctermfg=28   ctermbg=250
hi DiffChange      guifg=#cc7a0a guibg=#bfb9b6 gui=NONE       ctermfg=172  ctermbg=250
hi DiffDelete      guifg=#e14774 guibg=#bfb9b6 gui=NONE       ctermfg=161  ctermbg=250
hi DiffText        guifg=#e16032 guibg=#bfb9b6 gui=NONE       ctermfg=166  ctermbg=250
hi ErrorMsg        guifg=#e14774 guibg=NONE    gui=NONE       ctermfg=161  ctermbg=NONE
hi VertSplit       guifg=#bfb9b6 guibg=NONE    gui=NONE       ctermfg=250  ctermbg=NONE
hi Folded          guifg=#a59f9b guibg=#bfb9b6 gui=NONE       ctermfg=247  ctermbg=250
hi FoldColumn      guifg=#a59f9b guibg=#faf4f2 gui=NONE       ctermfg=247  ctermbg=255
hi SignColumn      guifg=#a59f9b guibg=#faf4f2 gui=NONE       ctermfg=247  ctermbg=255
hi IncSearch       guifg=#d5dee3 guibg=#000000 gui=NONE       ctermfg=255  ctermbg=172  " Selected search match
hi LineNr          guifg=#a59f9b guibg=NONE    gui=NONE       ctermfg=247  ctermbg=NONE
hi CursorLineNr    guifg=#cc7a0a guibg=NONE    gui=NONE       ctermfg=172  ctermbg=NONE cterm=NONE
hi MatchParen      guifg=#faf4f2 guibg=#e16032 gui=NONE       ctermfg=255  ctermbg=166
hi ModeMsg         guifg=#269d3d guibg=NONE    gui=NONE       ctermfg=28   ctermbg=NONE
hi MoreMsg         guifg=#269d3d guibg=NONE    gui=NONE       ctermfg=28   ctermbg=NONE
hi NonText         guifg=#bfb9b6 guibg=NONE    gui=NONE       ctermfg=250  ctermbg=NONE
hi Pmenu           guifg=#29242b guibg=#bfb9b6 gui=NONE       ctermfg=235  ctermbg=250
hi PmenuSel        guifg=#faf4f2 guibg=#cc7a0a gui=NONE       ctermfg=255  ctermbg=172
hi PmenuSbar       guifg=NONE    guibg=#bfb9b6 gui=NONE       ctermfg=NONE ctermbg=250
hi PmenuThumb      guifg=NONE    guibg=#a59f9b gui=NONE       ctermfg=NONE ctermbg=247
hi Question        guifg=#e14774 guibg=NONE    gui=NONE       ctermfg=161  ctermbg=NONE
hi Search          guifg=#000000 guibg=#ffd76d gui=NONE       ctermfg=255  ctermbg=172
hi SpecialKey      guifg=#bfb9b6 guibg=NONE    gui=NONE       ctermfg=250  ctermbg=NONE
hi SpellBad        guifg=#e14774 guibg=NONE    gui=underline  ctermfg=161  ctermbg=NONE cterm=underline
hi SpellCap        guifg=#cc7a0a guibg=NONE    gui=underline  ctermfg=172  ctermbg=NONE cterm=underline
hi SpellLocal      guifg=#e16032 guibg=NONE    gui=underline  ctermfg=166  ctermbg=NONE cterm=underline
hi SpellRare       guifg=#1c8ca8 guibg=NONE    gui=underline  ctermfg=31   ctermbg=NONE cterm=underline
hi StatusLine      guifg=#29242b guibg=#bfb9b6 gui=NONE       ctermfg=235  ctermbg=250
hi StatusLineNC    guifg=#a59f9b guibg=#bfb9b6 gui=NONE       ctermfg=247  ctermbg=250
hi TabLine         guifg=#a59f9b guibg=#bfb9b6 gui=NONE       ctermfg=247  ctermbg=250
hi TabLineFill     guifg=NONE    guibg=#bfb9b6 gui=NONE       ctermfg=NONE ctermbg=250
hi TabLineSel      guifg=#269d3d guibg=#faf4f2 gui=NONE       ctermfg=28   ctermbg=255
hi Title           guifg=#e14774 guibg=NONE    gui=NONE       ctermfg=161  ctermbg=NONE
hi Visual          guifg=NONE    guibg=#bfb9b6 gui=NONE       ctermfg=NONE ctermbg=250
hi WarningMsg      guifg=#cc7a0a guibg=NONE    gui=NONE       ctermfg=172  ctermbg=NONE
hi WildMenu        guifg=#faf4f2 guibg=#cc7a0a gui=NONE       ctermfg=255  ctermbg=172
