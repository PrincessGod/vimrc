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

set splitbelow
set splitright

set encoding=UTF-8
set guifont=Source\ Code\ Pro\ Light:h12

set backspace=indent,eol,start

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
    syntax on
endif

if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
endif


" Airline
let g:airline_powerline_fonts=1
let g:airline_theme='papercolor'

" Colorscheme
set background=light
colorscheme PaperColor
