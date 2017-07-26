"
" Vim general configurations
"
let mapleader=','
let g:mapleader=','

"" Set 4 spaces globally & make indenting sane.
"" ... Note that 'set paste' destroys indentation.
""
"" We could also set `tabstop`, but let's
"" keep tabs 'natural'.
set softtabstop=4 shiftwidth=4 expandtab autoindent

set number relativenumber wrap

"" TODO Display filename in vim

set clipboard^=unnamed,unnamedplus

set encoding=utf-8 fileencoding=utf-8

"" TODO disable showmode if using Airline
set showmode

set ignorecase smartcase incsearch hlsearch

set mouse=

