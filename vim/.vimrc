 " general
set nocompatible
set autoread
set hidden
set ignorecase
set smartcase
set mouse=a
set encoding=utf-8

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

" other
set wildignore=*/node_modules/*

" completion
set completeopt=menu,menuone,noselect

" vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

  Plugin 'VundleVim/Vundle.vim'

  " interface
  Plugin 'junegunn/fzf'
  Plugin 'junegunn/fzf.vim'
  Plugin 'francoiscabrol/ranger.vim'
  Plugin 'tpope/vim-fugitive'

  " completion
  Plugin 'neoclide/coc.nvim'
  " Plugin 'neoclide/coc-tsserver'
  " Plugin 'vim-denops/denops.vim'
  " Plugin 'Shougo/ddc.vim'
  " Plugin 'prabirshrestha/vim-lsp'

  " file management
  Plugin 'danro/rename.vim'

  " navigation
  Plugin 'tpope/vim-unimpaired'
  Plugin 'easymotion/vim-easymotion'

  " editing
  Plugin 'tpope/vim-surround'
  Plugin 'tpope/vim-commentary'
  Plugin 'suy/vim-context-commentstring'

  " " linting
  " Plugin 'dense-analysis/ale'

  " snippets
  Plugin 'jiangmiao/auto-pairs'
  Plugin 'sirver/ultisnips'
  Plugin 'mattn/emmet-vim'

  " syntax
  " Plugin 'dracula/vim',{'name':'dracula'}
  Plugin 'pangloss/vim-javascript'
  " Plugin 'uki00a/vim-deno'
  " Plugin 'leafgarland/typescript-vim'
  " Plugin 'mxw/vim-jsx'
  Plugin 'othree/html5.vim'
  Plugin 'cespare/vim-toml'
  Plugin 'cakebaker/scss-syntax.vim'
  Plugin 'posva/vim-vue'
  Plugin 'lervag/vimtex'
  Plugin 'jparise/vim-graphql'

call vundle#end()
filetype plugin indent on
" colorscheme dracula

" use in-built matchit plugin
runtime macros/matchit.vim

" " configure linters and fixers
" " 'typescript': ['eslint', 'tsserver'],
" " 'typescript': ['tsserver'],
" let g:ale_linters = {
" \ 'javascript': ['prettier', 'eslint'],
" \ 'typescript': ['eslint'],
" \}
" let g:ale_fixers = {
" \ 'typescript': ['prettier', 'eslint'],
" \ 'javascript': ['prettier', 'eslint'],
" \ 'vue': ['prettier', 'eslint'],
" \}
" " let g:ale_linters_ignore = {
" " \ 'typescript': ['tslint','deno'],
" " \}
" let g:ale_completion_enabled = 1

" " ale shortcuts
" map <Leader>aj :ALENext<CR>
" map <Leader>ak :ALEPrevious<CR>
" map <Leader>af :ALEFix<CR>

" completion
" let g:coc_global_extensions = [ 'coc-tsserver' ]
" call ddc#custom#patch_global('sources', ['ddc-vim-lsp'])

" command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
" nnoremap <c-p> :Prettier<CR>

command! -nargs=0 EslintFix : call CocAction('runCommand', 'eslint.executeAutofix')
nnoremap <Leader>f :EslintFix<CR>

" completion end

" output the current syntax group
nnoremap <f10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>

" fzf config
nnoremap <c-f> :Files<CR>
" let g:fzf_colors
" autocmd VimEnter,ColorScheme * call s:fzf_colors()
" nnoremap <c-g> :GFiles<CR>
let g:fzf_colors = { 'fg':    ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Comment'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

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

" delete a buffer without closing the split
nmap <silent> <leader>d :bp\|bd #<CR>


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

" " Tab for completion
" inoremap <silent><expr> <TAB>
"   \ pumvisible() ? "\<C-n>" :
"   \ CheckBackspace() ? "\<TAB>" :
"   \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! CheckBackspace() abort
"   let col = col('.') - 1
"     return !col || getline('.')[col - 1]  =~# '\s'
"   endfunction

" Command aliases
cnoreabbrev se UltiSnipsEdit
cnoreabbrev vconf e ~/.vimrc
cnoreabbrev ev e ~/.vimrc
cnoreabbrev bdo %bd\|e#\|bd#
" command! Bdo silent! execute "%bd|e#|bd#"

" " grep
set grepprg=grep\ -nr\ --exclude-dir={.git,node_modules,.build,cdk.out,dist}


" vimtex
let g:tex_flavor='latex'
