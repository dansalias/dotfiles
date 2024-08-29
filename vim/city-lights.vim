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
hi Comment ctermfg=8 cterm=italic
hi Type ctermfg=6
" hi typescriptTypeReference ctermfg=11
hi typescriptNodeGlobal ctermfg=5
hi typescriptBraces ctermfg=7
hi Constant ctermfg=4
hi Statement ctermfg=14
hi Title ctermfg=fg

hi Special ctermfg=12
hi Identifier ctermfg=12 cterm=NONE
" hi typescriptVariableDeclaration ctermfg=14
hi ALEError ctermfg=red cterm=underline
" hi graphqlType ctermfg=11
hi graphqlStructure ctermfg=7

" HTML
hi htmlTag ctermfg=gray
hi link htmlEndTag htmlTag
hi link htmlTagName htmlTag

" scss
hi scssVariable ctermfg=3

" git diffs
hi diffRemoved ctermfg=1
hi diffAdded ctermfg=2
