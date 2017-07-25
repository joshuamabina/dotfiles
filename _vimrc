set nocompatible

so $HOME/.vim/rc/general.vim
so $HOME/.vim/rc/plugins.vim

set autowrite
set ignorecase
set showcmd
set smartcase
set splitbelow
set splitright
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

colorscheme zazen 

command! MakeTags !ctags-exuberant -R .

source $HOME/.vim/rc/mappings.vim

