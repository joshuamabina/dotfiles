Plugin 'scrooloose/nerdtree'

let g:NERDTreeDirArrows=0
let g:NERDTreeChDirMode=2

let NERDTreeShowHidden=1
let NERDTreeRespectWildIgnore=1

nnoremap <silent> nt :NERDTreeToggle<CR>
nnoremap <silent> nr :NERDTree<CR>
nnoremap <silent> nf :NERDTreeFind<CR>
