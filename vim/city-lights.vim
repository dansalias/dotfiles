" general
set background=dark
highlight clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "city-lights"

" colours
let black=0
let gray=7
let grayDark=8
let white=15
let red=9
let redDark=1
let green=10
let greenDark=2
let yellow=11
let yellowDark=3
let blue=12
let blueDark=4
let magenta=13
let magentaDark=5
let cyan=14
let cyanDark=6

" interface
hi Normal  ctermfg=7  ctermbg=0
hi LineNr  ctermfg=8
hi clear CursorLine
hi CursorLineNr  ctermfg=7

" syntax
hi Comment ctermfg=8
hi Type ctermfg=14
hi Constant ctermfg=4
hi Statement ctermfg=3
hi Identifier ctermfg=11 cterm=NONE
hi Title ctermfg=fg

" HTML
hi htmlTag  ctermfg=gray
hi link htmlEndTag htmlTag
hi link htmlTagName htmlTag
