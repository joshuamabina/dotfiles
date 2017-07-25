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

"" Make it easy to use the clipboard
set clipboard^=unnamed,unnamedplus
