Plugin 'tpope/vim-fugitive'

nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>

nnoremap <silent> <leader>gC Git commit --amend<CR>
nnoremap <leader>stash :Git stash<CR>
nnoremap <leader>pop :Git stash pop<CR>
