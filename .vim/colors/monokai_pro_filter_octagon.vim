" Monokai Pro Filter Octagon
set background=dark
highlight clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="monokai_pro_filter_octagon"

" Convert hex to term256
let s:black = '#282733'       " bg
let s:dark_grey = '#696969'   " comment grey
let s:white = '#eaf2f1'       " fg
let s:red = '#ff6578'
let s:green = '#bad761'
let s:yellow = '#ffd76d'
let s:orange = '#ff9b5e'
let s:purple = '#c39ac9'
let s:cyan = '#9cd1bb'
let s:selection = '#535353'
let s:cursor = '#b2b9bd'

" Basic syntax groups
"hi Normal           guifg=#eaf2f1 guibg=#282733 gui=NONE      ctermfg=255 ctermbg=235
hi Normal          guifg=#eaf2f1 guibg=NONE gui=NONE      ctermfg=255 ctermbg=NONE
hi Comment          guifg=#696969 guibg=NONE gui=italic       ctermfg=242 ctermbg=NONE cterm=NONE
hi Constant         guifg=#ff9b5e guibg=NONE gui=NONE         ctermfg=209 ctermbg=NONE
hi String          guifg=#bad761 guibg=NONE gui=NONE          ctermfg=149 ctermbg=NONE
hi Character       guifg=#bad761 guibg=NONE gui=NONE          ctermfg=149 ctermbg=NONE
hi Number          guifg=#ff9b5e guibg=NONE gui=NONE          ctermfg=209 ctermbg=NONE
hi Boolean         guifg=#ff9b5e guibg=NONE gui=NONE          ctermfg=209 ctermbg=NONE
hi Float           guifg=#ff9b5e guibg=NONE gui=NONE          ctermfg=209 ctermbg=NONE
hi Identifier      guifg=#9cd1bb guibg=NONE gui=NONE          ctermfg=115 ctermbg=NONE
hi Function        guifg=#ffd76d guibg=NONE gui=NONE          ctermfg=221 ctermbg=NONE
hi Statement       guifg=#ff6578 guibg=NONE gui=NONE          ctermfg=204 ctermbg=NONE
hi Conditional     guifg=#ff6578 guibg=NONE gui=NONE          ctermfg=204 ctermbg=NONE
hi Repeat          guifg=#ff6578 guibg=NONE gui=NONE          ctermfg=204 ctermbg=NONE
hi Label           guifg=#ffd76d guibg=NONE gui=NONE          ctermfg=221 ctermbg=NONE
hi Operator        guifg=#ff6578 guibg=NONE gui=NONE          ctermfg=204 ctermbg=NONE
hi Keyword         guifg=#ff6578 guibg=NONE gui=NONE          ctermfg=204 ctermbg=NONE
hi Exception       guifg=#ff6578 guibg=NONE gui=NONE          ctermfg=204 ctermbg=NONE
hi PreProc         guifg=#ffd76d guibg=NONE gui=NONE          ctermfg=221 ctermbg=NONE
hi Include         guifg=#ff6578 guibg=NONE gui=NONE          ctermfg=204 ctermbg=NONE
hi Define          guifg=#ff6578 guibg=NONE gui=NONE          ctermfg=204 ctermbg=NONE
hi Macro           guifg=#ffd76d guibg=NONE gui=NONE          ctermfg=221 ctermbg=NONE
hi PreCondit       guifg=#bad761 guibg=NONE gui=NONE          ctermfg=149 ctermbg=NONE
hi Type            guifg=#bad761 guibg=NONE gui=NONE          ctermfg=149 ctermbg=NONE
hi StorageClass    guifg=#ffd76d guibg=NONE gui=NONE          ctermfg=221 ctermbg=NONE
hi Structure       guifg=#ffd76d guibg=NONE gui=NONE          ctermfg=221 ctermbg=NONE
hi Typedef         guifg=#ffd76d guibg=NONE gui=NONE          ctermfg=221 ctermbg=NONE
hi Special         guifg=#ff9b5e guibg=NONE gui=NONE          ctermfg=209 ctermbg=NONE
hi SpecialChar     guifg=#ff9b5e guibg=NONE gui=NONE          ctermfg=209 ctermbg=NONE
hi Tag             guifg=#ff6578 guibg=NONE gui=NONE          ctermfg=204 ctermbg=NONE
hi Delimiter       guifg=#ff6578 guibg=NONE gui=NONE          ctermfg=204 ctermbg=NONE
hi SpecialComment  guifg=#696969 guibg=NONE gui=NONE          ctermfg=242 ctermbg=NONE
hi Debug           guifg=#ff6578 guibg=NONE gui=NONE          ctermfg=204 ctermbg=NONE
hi Underlined      guifg=#9cd1bb guibg=NONE gui=underline     ctermfg=115 ctermbg=NONE cterm=underline
hi Ignore          guifg=#696969 guibg=NONE gui=NONE          ctermfg=242 ctermbg=NONE
hi Error           guifg=#ff6578 guibg=NONE gui=NONE          ctermfg=204 ctermbg=NONE
hi Todo            guifg=#ffd76d guibg=NONE gui=bold,italic   ctermfg=221 ctermbg=NONE cterm=bold

" Editor UI
hi ColorColumn     guifg=NONE    guibg=#535353 gui=NONE       ctermfg=NONE ctermbg=239
hi Cursor          guifg=#282733 guibg=#b2b9bd gui=NONE       ctermfg=235 ctermbg=249
hi CursorColumn    guifg=NONE    guibg=#535353 gui=NONE       ctermfg=NONE ctermbg=239
hi CursorLine      guifg=NONE    guibg=NONE gui=NONE       ctermfg=NONE ctermbg=NONE cterm=NONE
hi Directory       guifg=#ff6578 guibg=NONE    gui=NONE       ctermfg=204 ctermbg=NONE
hi DiffAdd         guifg=#bad761 guibg=#535353 gui=NONE       ctermfg=149 ctermbg=239
hi DiffChange      guifg=#ffd76d guibg=#535353 gui=NONE       ctermfg=221 ctermbg=239
hi DiffDelete      guifg=#ff6578 guibg=#535353 gui=NONE       ctermfg=204 ctermbg=239
hi DiffText        guifg=#ff9b5e guibg=#535353 gui=NONE       ctermfg=209 ctermbg=239
hi ErrorMsg        guifg=#ff6578 guibg=NONE    gui=NONE       ctermfg=204 ctermbg=NONE
hi VertSplit       guifg=#535353 guibg=NONE    gui=NONE       ctermfg=239 ctermbg=NONE
hi Folded          guifg=#696969 guibg=#535353 gui=NONE       ctermfg=242 ctermbg=239
hi FoldColumn      guifg=#696969 guibg=#282733 gui=NONE       ctermfg=242 ctermbg=235
hi SignColumn      guifg=#696969 guibg=#282733 gui=NONE       ctermfg=242 ctermbg=235
hi IncSearch       guifg=#d5dee3 guibg=NONE    gui=NONE       ctermfg=235 ctermbg=221  "Selected search match
hi LineNr          guifg=#696969 guibg=NONE    gui=NONE       ctermfg=242 ctermbg=NONE
hi CursorLineNr    guifg=#ffd76d guibg=NONE    gui=NONE       ctermfg=221 ctermbg=NONE cterm=NONE
hi MatchParen      guifg=#282733 guibg=#ff9b5e gui=NONE       ctermfg=235 ctermbg=209
hi ModeMsg         guifg=#bad761 guibg=NONE    gui=NONE       ctermfg=149 ctermbg=NONE
hi MoreMsg         guifg=#bad761 guibg=NONE    gui=NONE       ctermfg=149 ctermbg=NONE
hi NonText         guifg=#535353 guibg=NONE    gui=NONE       ctermfg=239 ctermbg=NONE
hi Pmenu           guifg=#eaf2f1 guibg=#535353 gui=NONE       ctermfg=255 ctermbg=239
hi PmenuSel        guifg=#282733 guibg=#ffd76d gui=NONE       ctermfg=235 ctermbg=221
hi PmenuSbar       guifg=NONE    guibg=#535353 gui=NONE       ctermfg=NONE ctermbg=239
hi PmenuThumb      guifg=NONE    guibg=#696969 gui=NONE       ctermfg=NONE ctermbg=242
hi Question        guifg=#ff6578 guibg=NONE    gui=NONE       ctermfg=204 ctermbg=NONE
hi Search          guifg=#282733 guibg=#ffd76d gui=NONE       ctermfg=235 ctermbg=221
hi SpecialKey      guifg=#535353 guibg=NONE    gui=NONE       ctermfg=239 ctermbg=NONE
hi SpellBad        guifg=#ff6578 guibg=NONE    gui=underline  ctermfg=204 ctermbg=NONE cterm=underline
hi SpellCap        guifg=#ffd76d guibg=NONE    gui=underline  ctermfg=221 ctermbg=NONE cterm=underline
hi SpellLocal      guifg=#ff9b5e guibg=NONE    gui=underline  ctermfg=209 ctermbg=NONE cterm=underline
hi SpellRare       guifg=#9cd1bb guibg=NONE    gui=underline  ctermfg=115 ctermbg=NONE cterm=underline
hi StatusLine      guifg=#eaf2f1 guibg=#535353 gui=NONE       ctermfg=255 ctermbg=239
hi StatusLineNC    guifg=#696969 guibg=#535353 gui=NONE       ctermfg=242 ctermbg=239
hi TabLine         guifg=#696969 guibg=#535353 gui=NONE       ctermfg=242 ctermbg=239
hi TabLineFill     guifg=NONE    guibg=#535353 gui=NONE       ctermfg=NONE ctermbg=239
hi TabLineSel      guifg=#bad761 guibg=#282733 gui=NONE       ctermfg=149 ctermbg=235
hi Title           guifg=#ff6578 guibg=NONE    gui=NONE       ctermfg=204 ctermbg=NONE
hi Visual          guifg=NONE    guibg=#535353 gui=NONE       ctermfg=NONE ctermbg=239
hi WarningMsg      guifg=#ffd76d guibg=NONE    gui=NONE       ctermfg=221 ctermbg=NONE
hi WildMenu        guifg=#282733 guibg=#ffd76d gui=NONE       ctermfg=235 ctermbg=221
