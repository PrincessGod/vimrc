" Get system info
if !exists('g:os')
    if has('win32') || has('win16')
        let g:os = 'Windows'
    else
        let g:os = substitute(system('uname'), '\n', '', '')
    endif
endif

if g:os == 'Darwin'
    " mac stuff
endif

if g:os == 'Linux'
    " linux stuff
endif

if g:os == 'Windows'
    " windows stuff
endif
" end


set nocompatible

set cursorline

set ruler
set showcmd
set incsearch
set hlsearch
set laststatus=2
set directory^=$HOME/.vim/tmp//

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

if has("gui_running") && g:os=='Windows'
    set lines=35 columns=120
    winpos 300 60
endif

let mapleader=","
map <space> :
map <c-space> /
map <silent> <leader><cr> :noh<cr>
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
map <leader>yy "*y
map <leader>] :lnext<cr>
map <leader>[ :lprevious<cr>

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

cnoremap <left> <nop>
cnoremap <up> <nop>
cnoremap <down> <nop>
cnoremap <right> <nop>
cnoremap <C-h> <left>
cnoremap <C-j> <down>
cnoremap <C-k> <up>
cnoremap <C-l> <right>
cnoremap <leader>pp <C-r>*
cnoremap <leader>p <C-r>" 

if has("gui_running") && g:os=='Windows'
    map <A-j> :move +<CR>
    map <A-k> :move -2<CR>
    inoremap <A-j> <ESC>:move +<CR>==gi
    inoremap <A-k> <ESC>:move -2<CR>==gi
    inoremap <C-BS> <C-w>
endif
if g:os=='Darwin'
    map ∆ :move +<CR>
    map ˚ :move -2<CR>
    inoremap ∆ <ESC>:move +<CR>==gi
    inoremap ˚ <ESC>:move -2<CR>==gi
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
" If nerdtree is only window, close vim.
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" CtrlP
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.)*(git|hg|svn|build|node_modules)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }
let g:ctrlp_show_hidden = 1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_aggregating_errors = 1
let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'
highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn
" execute eslint with --fix flag
let g:syntastic_javascript_eslint_args = ['--fix']
" enable autoread to reload any files from files when checktime is called and
" the file is changed
set autoread
" add an autocmd after vim started to execute checktime for *.js files on write
au VimEnter *.js au BufWritePost *.js checktime

" Ack
map <leader>a :Ack! 
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
endif

" YCM
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
map <leader>ff :YcmCompleter FixIt<CR>
map <leader>gg :YcmCompleter GoTo<CR>
map <leader>dd :YcmCompleter GetDoc<CR>

" Vim Better Whitesapce
map <leader>tt :ToggleWhitespace<CR>
map <leader>ta :StripWhitespace<CR>
