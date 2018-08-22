" Load all the plugins on startup

filetype off
filetype plugin indent off

set runtimepath+=$HOME/.vim/bundle/Vundle.vim

call vundle#begin()

runtime! rc/plugins/*.vim

Plugin 'groovy.vim'
Plugin 'zaki/zazen'
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
Plugin 'ap/vim-css-color'
Plugin 'tpope/vim-repeat'
Plugin 'othree/html5.vim'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'airblade/vim-rooter'
Plugin 'jwalton512/vim-blade'
Plugin 'chase/vim-ansible-yaml'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'vimperator/vimperator.vim'
Plugin 'johngrib/vim-game-code-break'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'ternjs/tern_for_vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'thoughtbot/vim-rspec'

call vundle#end()

filetype plugin indent on
syntax on
