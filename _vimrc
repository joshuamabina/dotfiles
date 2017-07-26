set nocompatible

so $HOME/.vim/rc/general.vim
so $HOME/.vim/rc/plugins.vim
so $HOME/.vim/rc/ui.vim

set splitbelow
set splitright
set wildmenu
set wildignore+=.DS_Store,*.o,*.class,*.pyc,.git/*,node_modules/*,vendor/*

set shell=$SHELL
set laststatus=2

set path+=**

command! MakeTags !ctags-exuberant -R .

source $HOME/.vim/rc/mappings.vim
