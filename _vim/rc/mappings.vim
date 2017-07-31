" Quickly open/reload vim
nnoremap <silent> <leader>ev :split $MYVIMRC<CR>
nnoremap <silent> <leader>sv :source $MYVIMRC<CR> :echo "Source reloaded!"<CR>

" No ex-mode. Prettify line instead.
nnoremap Q gqq

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
"nnoremap <silent> tt :tabedit<CR>
nnoremap <silent> tj :tabprev<CR>
nnoremap <silent> tk :tabnext<CR>
nnoremap <silent> th :tabfirst<CR>
nnoremap <silent> tl :tablast<CR>

" Split window
nnoremap <silent> <leader>wn :split<CR>
nnoremap <silent> <leader>ww :vsplit<CR>

" Move lines
nnoremap <silent> <C-j> :m .+1<CR>==
nnoremap <silent> <C-k> :m .-2<CR>==
vnoremap <silent> <C-j> :m '> +1<CR>gv=gv
vnoremap <silent> <C-k> :m '< -2<CR>gv=gv
