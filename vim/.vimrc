" plugins
call plug#begin()
  Plug 'scrooloose/nerdtree'
  Plug 'itchyny/lightline.vim'
  Plug 'scrooloose/syntastic'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'wombat256.vim'
  Plug 'altercation/vim-colors-solarized'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'leafgarland/typescript-vim'
  Plug 'Quramy/tsuquyomi'
  Plug 'Shougo/vimproc.vim'
  Plug 'easymotion/vim-easymotion'
"	Plug 'ervandew/supertab'
  Plug 'valloric/youcompleteme'
"	Plug 'sirver/ultisnips'
"	Plug 'honza/vim-snippets'
"	Plug 'raimondi/delimitmate'
  Plug 'posva/vim-vue'
"  Plug 'alvan/vim-closetag'
  Plug 'docunext/closetag.vim'
"  Plug 'othree/xml.vim'
  Plug 'mattn/emmet-vim'
call plug#end()

" automatically update unedited buffers when file is changed
set autoread

" case insensitve search
set ignorecase
set smartcase

" color scheme
set term=screen-256color
syntax on
let g:solarized_termcolors=256
set t_Co=256
set background=dark
colorscheme solarized

" status bar
set laststatus=2
" let g:lightline = {
"	\ 'colorscheme': 'wombat',
"	\ }

" show numbers by default
set number

" don't wrap lines
set nowrap

" switch unwritten buffers without !
set hidden

" NERDTree settings (always open, switch focus, set size, close if last)
" autocmd vimenter * NERDTree
" autocmd vimenter * wincmd p
let NERDTreeShowHidden = 1
let g:NERDTreeWinSize = 40
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" set default tab width to two spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" use <kj> to switch to normal mode
ino kj <esc>
vno kj <esc>

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" UltiSnips config 
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>""

" Syntastic config
let g:syntastic_javascript_checkers = ['eslint']

" Vim-closetag config
let g:closetag_filenames = "*.html, *.vue"

" set linux alt mappings
execute "set <A-j>=\ej"
execute "set <A-k>=\ek"

" Move lines and blocks up/down using Alt k/j
" http://vim.wikia.com/wiki/Moving_lines_up_or_down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
