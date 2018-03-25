" general
set nocompatible
set autoread
set hidden
set ignorecase
set smartcase
set mouse=a
let g:mapleader = "\<Space>"

" interface
set number
set cursorline
set showcmd
set nowrap
set fillchars+=vert:\ 

" syntax
set t_Co=16
syntax on
colorscheme city-lights

" indentation
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

  " interface
  Plugin 'termhn/i3-vim-nav'
  Plugin 'junegunn/fzf'
  Plugin 'junegunn/fzf.vim'

  " navigation
  Plugin 'tpope/vim-unimpaired'
  Plugin 'easymotion/vim-easymotion'

  " editing
  Plugin 'tpope/vim-surround'
  Plugin 'tpope/vim-commentary'

  " linting
  Plugin 'w0rp/ale'

  " snippets
  Plugin 'sirver/ultisnips'
  Plugin 'mattn/emmet-vim'

  " syntax
  Plugin 'pangloss/vim-javascript'
  Plugin 'mxw/vim-jsx'
  Plugin 'othree/html5.vim'
  Plugin 'cespare/vim-toml'

call vundle#end()
filetype plugin indent on

" use in-built matchit plugin
runtime macros/matchit.vim

" i3-style window navigation
nnoremap <silent> <A-h> :call Focus('left', 'h')<CR>
nnoremap <silent> <A-j> :call Focus('down', 'j')<CR>
nnoremap <silent> <A-k> :call Focus('up', 'k')<CR>
nnoremap <silent> <A-l> :call Focus('right', 'l')<CR>

" define which linters to use
let g:ale_linted = {
\ 'javascript': ['eslint'],
\}

" output the current syntax group
nnoremap <f10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>

" fzf config
nnoremap <c-f> :Files<CR>
nnoremap <c-g> :GFiles<CR>

" remap easymotion leader
map <Leader> <Plug>(easymotion-prefix)

" hide netrw banner
let g:netrw_banner = 0

" kj/jk to escape
map! kj <esc>
map! jk <esc>

" tab navigation
nnoremap <leader>p :tabprevious<CR>
nnoremap <leader>n :tabnext<CR>
nnoremap <c-t> :tabedit<CR>
nnoremap <c-q> :tabclose<CR>

" UltiSnips config
set runtimepath+=~/projects/dotfiles/vim
let g:UltiSnipsSnippetsDir="~/projects/dotfiles/vim/UltiSnips"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigget="<c-k>"
let g:UltiSnipsEditSplit="vertical"

" Command aliases
cnoreabbrev se UltiSnipsEdit
cnoreabbrev vconf e ~/.vimrc
