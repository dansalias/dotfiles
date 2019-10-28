" general
set nocompatible
set autoread
set hidden
set ignorecase
set smartcase
set mouse=a

" interface
set number
set cursorline
set showcmd
set nowrap
set scrolloff=1
set fillchars+=vert:\ 
set nohlsearch
set incsearch

" basic remaps
noremap ' `
noremap . ;
noremap <Space> .
let mapleader = ";"

" syntax
set t_Co=16
syntax on
autocmd BufEnter * :syntax sync fromstart
colorscheme city-lights

" indentation
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" allow project-specific .vimrc
set exrc
set secure

" vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

  " interface
  Plugin 'junegunn/fzf'
  Plugin 'junegunn/fzf.vim'
  Plugin 'francoiscabrol/ranger.vim'

  " file management
  Plugin 'danro/rename.vim'

  " navigation
  Plugin 'tpope/vim-unimpaired'
  Plugin 'easymotion/vim-easymotion'

  " editing
  Plugin 'tpope/vim-surround'
  Plugin 'tpope/vim-commentary'

  " linting
  Plugin 'w0rp/ale'

  " snippets
  Plugin 'jiangmiao/auto-pairs'
  Plugin 'sirver/ultisnips'
  Plugin 'mattn/emmet-vim'

  " syntax
  Plugin 'pangloss/vim-javascript'
  Plugin 'leafgarland/typescript-vim'
  Plugin 'mxw/vim-jsx'
  Plugin 'othree/html5.vim'
  Plugin 'cespare/vim-toml'
  Plugin 'cakebaker/scss-syntax.vim'
  Plugin 'posva/vim-vue'
  Plugin 'lervag/vimtex'

call vundle#end()
filetype plugin indent on

" use in-built matchit plugin
runtime macros/matchit.vim

" configure linters and fixers
" 'typescript': ['eslint', 'tsserver'],
" 'typescript': ['tsserver'],
let g:ale_linters = {
\ 'javascript': ['eslint'],
\}
let g:ale_fixers = {
\ 'javascript': ['prettier', 'eslint'],
\ 'vue': ['prettier', 'eslint'],
\}
let g:ale_linters_ignore = {
\ 'typescript': ['tslint'],
\}
let g:ale_completion_enabled = 1

" ale shortcuts
map <Leader>aj :ALENext<CR>
map <Leader>ak :ALEPrevious<CR>
map <Leader>af :ALEFix<CR>

" output the current syntax group
nnoremap <f10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>

" fzf config
nnoremap <c-f> :Files<CR>
" nnoremap <c-g> :GFiles<CR>

" ranger config
let g:ranger_map_keys = 0
map <Leader>r :Ranger<CR>

" netrw config
map <Leader>n :Explore<CR>

" remap easymotion leader
map <Leader> <Plug>(easymotion-prefix)

" hide netrw banner
let g:netrw_banner = 0

" kj/jk to escape
map! kj <esc>
map! jk <esc>

" tab navigation
noremap <C-t>h :tabprevious<CR>
noremap <C-t>l :tabnext<CR>
noremap <C-t>k :tabfirst<CR>
noremap <C-t>j :tablast<CR>
noremap <C-t>n :tabnew<CR>
noremap <C-t>e :tabedit<Space>
noremap <C-t>c :tabclose<CR>
noremap <C-t>m :tabm<Space>

" move lines up/down using Ctrl+Shift+J/K
nnoremap <C-J> :m .+1<CR>==
nnoremap <C-K> :m .-2<CR>==

" Auto-expand snippets
" inoremap (; (<CR>);<C-c>O
" inoremap (, (<CR>),<C-c>O
" inoremap {; {<CR>};<C-c>O
" inoremap {, {<CR>},<C-c>O
" inoremap [; [<CR>];<C-c>O
" inoremap [, [<CR>],<C-c>O
" inoremap `; ``;<C-c>hi
" inoremap `, ``,<C-c>hi
" inoremap '; '';<C-c>hi
" inoremap ', '',<C-c>hi

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
cnoreabbrev ev e ~/.vimrc
