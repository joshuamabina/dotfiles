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

"" Make it easy to use the clipboard
set clipboard^=unnamed,unnamedplus

"" TODO encoding, fileencoding utf-8!

"" TODO always show mode I am on

"" TODO Make searching easy and case sensitive

"" TODO Disable the mouse
