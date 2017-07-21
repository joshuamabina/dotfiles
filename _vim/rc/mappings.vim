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
