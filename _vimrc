syntax enable

filetype off
set nocompatible

so $HOME/.vim/plugins.vim

autocmd!
set autoread
set autowrite

" Indentation {{{
filetype plugin indent on
set autoindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
" }}}

set ttyfast
set wildmenu
set wildignore+=.DS_Store,*.o,*.class,*.pyc,.git/*,node_modules/*,vendor/*

set backupdir=/tmp
set directory=/tmp

" Colors
set t_Co=256

" Fonts
set guifont=Literation\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12

set shell=$SHELL
set laststatus=2
set encoding=utf8
set background=dark
set relativenumber

set path+=**

set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set nolist

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
set tabstop=2
set shiftwidth=2

colorscheme zazen 

command! MakeTags !ctags-exuberant -R .

" }}}

" Section Plugin Options {{{

let g:NERDTreeChDirMode       = 2
let g:ctrlp_working_path_mode = 'rw'

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
let g:ctrlp_max_files=0
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn|idea)|build|public|node_modules|vendor)$',
  \ 'file': '\v\.(exe|so|dll|o|obj|class|png|jpg|jpeg|mp3|mp4)$',
\}

" NerdTree
let NERDTreeShowHidden=1
let NERDTreeRespectWildIgnore=1

" Syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0

" InstantMarkdown
let g:instant_markdown_autostart=0

" JavaComplete
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" JSX
let g:jsx_ext_required=0

" PHP-CS-Fixer
let g:php_cs_fixer_rules='@Symfony'

" Vue
autocmd FileType vue syntax sync fromstart

" }}}

" Section Mappings {{{

let mapleader=';'
let g:mapleader=';'
let maplocalleader=';'

"Make it easy to edit the vim source.
nmap <Leader>ev :tabedit $HOME/.vimrc<CR>

"TODO Automatically source the vim source on save.

" Reload vim source
nnoremap <silent> <F5> :source $HOME/.vimrc<CR> :echo "Source reloaded!"<CR>

" Ex-mode
nnoremap Q gq

" Editing
"" TODO: New line below and remain in normal mode
"" TODO: New line above and remain in normal mode

" Arrows
map <Left> :echoboo "use h"<CR>
map <Up> :echoboo "use j"<CR>
map <Down> :echoboo "use k"<CR>
map <Right> :echoboo "use l"<CR>

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
nnoremap <silent> <leader>wh <C-w>h
nnoremap <silent> <leader>wj <C-w>j
nnoremap <silent> <leader>wk <C-w>k
nnoremap <silent> <leader>wl <C-w>l
nnoremap <silent> <leader>wn :split<CR>
nnoremap <silent> <leader>ww :vsplit<CR>

"
" Lines
"
nnoremap <silent> <C-j> :m .+1<CR>==
nnoremap <silent> <C-k> :m .-2<CR>==
inoremap <silent> <C-k> <Esc>:m .-2<CR>==gi
inoremap <silent> <C-j> <Esc>:m .+1<CR>==gi
vnoremap <silent> <C-j> :m '> +1<CR>gv=gv
vnoremap <silent> <C-k> :m '< -2<CR>gv=gv

"
" Clipboard
"
vmap <silent> <leader>y "+y
noremap <silent> <leader>p "+p

"
" PHP-CS-Fixer
"
nnoremap <silent> <leader>pcd :call PhpCsFixerFixDirectory()<CR>
nnoremap <silent> <leader>pcf :call PhpCsFixerFixFile()<CR>

"
" Vimux
"
nnoremap <silent> <leader>vp :VimuxPromptCommand<CR>
nnoremap <silent> <leader>vl :VimuxRunLastCommand<CR>

"
" JavaComplete2
"
nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
imap <F4> <Plug>(JavaComplete-Imports-AddSmart)

"nmap <F5> <Plug>(JavaComplete-Imports-Add)
"imap <F5> <Plug>(JavaComplete-Imports-Add)

nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
imap <F6> <Plug>(JavaComplete-Imports-AddMissing)

"
" Git
"

nnoremap <silent> <Leader>gd :Gdiff<cr>
nnoremap <silent> <Leader>gl :Glog<cr>
nnoremap <silent> <Leader>gs :Gstatus<cr>
nnoremap <silent> <Leader>gb :Gblame<cr>
nnoremap <silent> <Leader>gc :Gcommit<cr>
nnoremap <silent> <Leader>amend :Git commit --amend<cr>
nnoremap <silent> <Leader>stash :Git stash<cr>
nnoremap <silent> <Leader>pop :Git stash pop<cr>

" }}}

