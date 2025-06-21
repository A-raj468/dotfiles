let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1

colorscheme tokyonight

" Use a line cursor within insert mode and a block cursor everywhere else
" 
" Reference chart of value:
" Ps = 0 -> blinking block.
" Ps = 1 -> blinking block (default).
" Ps = 2 -> steady block.
" Ps = 3 -> blinking underline.
" Ps = 4 -> steady underline.
" Ps = 5 -> blinking bar (xterm).
" Ps = 6 -> steady term (xterm).
let &t_SI = "\e[5 q"
let &t_EI = "\e[1 q"

let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

set mouse=a

set smartindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set number
set relativenumber
set ruler
set wrap
set scrolloff=8

set path+=**
set wildmenu

set clipboard=unnamedplus

syntax on
set foldmethod=syntax
set foldlevel=3

set showmatch
set incsearch

set cursorline
au WinEnter,FocusGained * set cursorline
au WinLeave,FocusLost * set nocursorline

vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

vnoremap ; :

nnoremap ; :
nnoremap j gj
nnoremap k gk

nnoremap <C-s> <CMD>w<CR>
nnoremap <C-q> <CMD>qa<CR>

nnoremap <C-j> <CMD>m+1<CR>==
nnoremap <C-k> <CMD>m-2<CR>==

nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

inoremap <C-s> <ESC><CMD>w<CR>

inoremap <C-j> <CMD>m+1<CR><C-o>==
inoremap <C-k> <CMD>m-2<CR><C-o>==
