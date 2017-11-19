" general
set nocompatible
set autoread
set hidden
set ignorecase
set smartcase

" interface
set number
set relativenumber
set nowrap

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

  " utility
  Plugin 'gerw/vim-hilinktrace'

  " syntax
  Plugin 'pangloss/vim-javascript'
  Plugin 'othree/html5.vim'

call vundle#end()
filetype plugin indent on

" use in-built matchit plugin
runtime macros/matchit.vim

" output the current syntax group
nnoremap <f10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>

" custom mappings
map! kj <esc>
map! jk <esc>
