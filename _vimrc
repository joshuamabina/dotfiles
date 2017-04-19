" Section General {{{

filetype off
filetype plugin indent on

" Be IMproved
set nocompatible
set ttyfast

" Plugins
so $HOME/.vim/plugins.vim

set autoindent
set autoread
set autowrite	

" Swap files
set backupdir=/tmp
set directory=/tmp

" Colors
set t_Co=256

" Fonts
set guifont=Literation\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12

set shell=$SHELL
set laststatus=2
set encoding=utf8
"set background=dark

set number
set nowrap
set showcmd
set autowrite
set smartcase
set splitbelow
set splitright
set ignorecase
set autoindent
set copyindent

syntax enable
colorscheme zazen

" }}}

" Section Plugin Options {{{

let g:vundle_default_git_proto='git'

" Airline
let g:airline_theme='raven'
let g:airline_powerline_fonts=1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#tmuxline#enabled=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extesions#tabline#tab_min_count=3
let g:airline#extensions#tabline#show_buffers=0

" CtrlP
let g:ctrlp_show_hidden=1

" NerdTree
let NERDTreeShowHidden=1

" Syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0

" InstantMarkdown
let g:instant_markdown_autostart=0

" Java
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" JSX
let g:jsx_ext_required=0

" PHP-CS-Fixer
"let g:php_cs_fixer_rules='@PSR2'
" let g:php_cs_fixer_config_file='.php_cs'
"let g:php_cs_fixer_enable_default_mapping=1

" }}}

" Section Mappings {{{

let mapleader=','
let g:mapleader=','
let maplocalleader=',,'

" Ex-mode
nnoremap Q <nop>

" Editing
"" TODO: New line below and remain in normal mode
"" TODO: New line above and remain in normal mode

" Arrows
nnoremap <Left> :echoboo "use h"<CR>
nnoremap <Up> :echoboo "use j"<CR>
nnoremap <Down> :echoboo "use k"<CR>
nnoremap <Right> :echoboo "use l"<CR>

"
" Tabs
"
nnoremap <silent> tt :tabedit<CR>
nnoremap <silent> td :tabclose<CR>

" Navigation
nnoremap <silent> tj :tabprev<CR>
nnoremap <silent> tk :tabnext<CR>
nnoremap <silent> th :tabfirst<CR>
nnoremap <silent> tl :tablast<CR>

" Position 
nnoremap <silent> <leader>tj :-tabmove<CR>
nnoremap <silent> <leader>tk :+tabmove<CR>
nnoremap <silent> <leader>th :0tabmove<CR>
nnoremap <silent> <leader>tl :$tabmove<CR>

"
" NerdTree 
"
nnoremap <silent> nt :NERDTreeToggle<CR>
nnoremap <silent> nr :NERDTree<CR>
nnoremap <silent> nf :NERDTreeFind<CR>

"
" Splits
"
nnoremap wh <C-w>h
nnoremap wj <C-w>j
nnoremap wk <C-w>k
nnoremap wl <C-w>l
nnoremap <silent> wn :split<CR>
nnoremap <silent> ww :vsplit<CR>

"
" Lines
"
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-k> <Esc>:m .-2<CR>==gi
inoremap <C-j> <Esc>:m .+1<CR>==gi
vnoremap <C-j> :m '> +1<CR>gv=gv
vnoremap <C-k> :m '< -2<CR>gv=gv

"
" Clipboard
"
vmap <silent> <leader>y "+y
noremap <silent> <leader>p "+p

"
" Vimux
"
nnoremap <silent> <leader>vp :VimuxPromptCommand<CR>
nnoremap <silent> <leader>vl :VimuxRunLastCommand<CR>

" }}}

