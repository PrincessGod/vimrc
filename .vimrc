set nocompatible

set cursorline

set ruler
set showcmd
set incsearch
set hlsearch
set laststatus=2

set tabstop=4
set shiftwidth=4
set shiftround
set expandtab

set number
set numberwidth=5

set wildmenu
set wildmode=list:longest,list:full
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe

set splitbelow
set splitright
set fillchars=vert:\ 

set encoding=UTF-8
set guifont=Sarasa\ Mono\ SC:h14

set backspace=indent,eol,start

set guioptions-=m  " remove menu bar
set guioptions-=T  " remove toolbar
set guioptions-=r  " remove right-hand scroll bar
set guioptions-=L  " remove left-hand scroll bar
set guioptions=    " remove all

if has("gui_running")
    set lines=35 columns=120
    winpos 300 60
endif

let mapleader=","
map <space> :
map <c-space> /
map <silent> <leader><cr> :noh<cr> "remove search highlight
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <left> <nop>
map <up> <nop>
map <down> <nop>
map <right> <nop>
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
map <leader>cd :cd %:p:h<cr>:pwd<cr>
map <leader>pp "*p

inoremap <left> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <right> <nop>
inoremap <leader><leader>( ()<esc>i
inoremap <leader><leader>[ []<esc>i
inoremap <leader><leader>{ {}<esc>i
inoremap <leader><leader>} {<esc>o}<esc>O
inoremap <leader><leader>' ''<esc>i
inoremap <leader><leader>" ""<esc>i
inoremap <leader><leader>< <><esc>i
inoremap <C-BS> <C-w>

cnoremap <left> <nop>
cnoremap <up> <nop>
cnoremap <down> <nop>
cnoremap <right> <nop>
cnoremap <C-h> <left>
cnoremap <C-j> <down>
cnoremap <C-k> <up>
cnoremap <C-l> <right>

if has("gui_running")
    map <A-j> :move +<CR>
    map <A-k> :move -2<CR>
    inoremap <A-j> <ESC>:move +<CR>==gi
    inoremap <A-k> <ESC>:move -2<CR>==gi
    inoremap <A-BS> <ESC>d0i
endif

if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
    syntax on
endif

if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
endif

if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif

set pythondll=C:\Users\PrincessGod\AppData\Local\Programs\Python\Python37-32\python37.dll
" Plugin Settings
" Airline
let g:airline_powerline_fonts=1
let g:airline_theme='papercolor'

" Colorscheme
set background=light
colorscheme PaperColor

" NERD Tree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden=1
map <leader>nn :NERDTreeToggle<CR>
map <leader>nf :NERDTreeFind
" If previous buffer was NERDTree, go back to it.
autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" | b# | endif

" CtrlP
let g:ctrlp_show_hidden = 1

