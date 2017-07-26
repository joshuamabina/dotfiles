" Load all the plugins on startup

filetype off
filetype plugin indent off

set runtimepath+=$HOME/.vim/bundle/Vundle.vim

call vundle#begin()

runtime! rc/plugins/*.vim

Plugin 'benmills/vimux'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'editorconfig/editorconfig-vim'
"Plugin 'easymotion/vim-easymotion'
Plugin 'airblade/vim-rooter'
Plugin 'johngrib/vim-game-code-break'

Plugin 'zaki/zazen'

Plugin 'ap/vim-css-color'
Plugin 'othree/html5.vim'
Plugin 'jwalton512/vim-blade'
Plugin 'vimperator/vimperator.vim'

call vundle#end()

filetype plugin indent on
syntax on
