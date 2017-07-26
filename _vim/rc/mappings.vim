" No ex-mode. Prettify line instead.
nnoremap Q gqq

" Quickly open/reload vim
nnoremap <silent> <leader>ev :split $MYVIMRC<CR>
nnoremap <silent> <leader>sv :source $MYVIMRC<CR> :echo "Source reloaded!"<CR>

" Write file as sudo
cmap w!! w !sudo tee > /dev/null &

" Use hjkl
map <Left> :echoboo "use h"<CR>
map <Up> :echoboo "use j"<CR>
map <Down> :echoboo "use k"<CR>
map <Right> :echoboo "use l"<CR>

" Stop highlighting
nnoremap <C-L> <CR> :noh<CR><C-L>

" Navigate tabs
nnoremap <silent> tt :tabedit<CR>
nnoremap <silent> tj :tabprev<CR>
nnoremap <silent> tk :tabnext<CR>
nnoremap <silent> th :tabfirst<CR>
nnoremap <silent> tl :tablast<CR>

" Move tabs
nnoremap <silent> <leader>tj :-tabmove<CR>
nnoremap <silent> <leader>tk :+tabmove<CR>
nnoremap <silent> <leader>th :0tabmove<CR>
nnoremap <silent> <leader>tl :$tabmove<CR>

" Split window(s)
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
