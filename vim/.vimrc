" general
set nocompatible
set autoread
set hidden
set ignorecase
set smartcase
let g:mapleader = "\<Space>"

" interface
set number
set cursorline
set showcmd
set nowrap
set hlsearch
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
  Plugin 'junegunn/fzf'
  Plugin 'junegunn/fzf.vim'

  " navigation
  Plugin 'tpope/vim-unimpaired'

  " editing
  Plugin 'tpope/vim-surround'
  Plugin 'tpope/vim-commentary'

  " linting
  Plugin 'w0rp/ale'

  " syntax
  Plugin 'pangloss/vim-javascript'
  Plugin 'mxw/vim-jsx'
  Plugin 'othree/html5.vim'

call vundle#end()
filetype plugin indent on

" use in-built matchit plugin
runtime macros/matchit.vim

" define which linters to use
let g:ale_linted = {
\ 'javascript': ['eslint'],
\}

" define which linters to use
let g:ale_fixers = {
\ 'javascript': ['eslint'],
\}

" output the current syntax group
nnoremap <f10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>

" fzf config
nnoremap <c-f> :Files<CR>
nnoremap <c-g> :GFiles<CR>

" kj/jk to escape
map! kj <esc>
map! jk <esc>

" tab navigation
nnoremap <leader>p :tabprevious<CR>
nnoremap <leader>n :tabnext<CR>
nnoremap <c-t> :tabedit<CR>
nnoremap <c-q> :tabclose<CR>
