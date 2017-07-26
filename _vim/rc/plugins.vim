" Load all the plugins on startup

filetype off
filetype plugin indent off

set runtimepath+=$HOME/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

runtime! rc/plugins/*.vim

Plugin 'benmills/vimux'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'vim-syntastic/syntastic'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'editorconfig/editorconfig-vim'
"Plugin 'easymotion/vim-easymotion'
Plugin 'airblade/vim-rooter'
Plugin 'johngrib/vim-game-code-break'

Plugin 'zaki/zazen'
"Plugin 'ryanoasis/vim-devicons' 

Plugin 'mxw/vim-jsx'
Plugin 'posva/vim-vue'
Plugin 'ap/vim-css-color'
Plugin 'othree/html5.vim'
Plugin 'jwalton512/vim-blade'
"Plugin 'freitass/todo.txt-vim'
Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'suan/vim-instant-markdown'
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'vimperator/vimperator.vim'

call vundle#end()

filetype plugin indent on
syntax on

let g:NERDTreeChDirMode       = 2
let g:ctrlp_working_path_mode = 'rw'

let g:vundle_default_git_proto='git'

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
