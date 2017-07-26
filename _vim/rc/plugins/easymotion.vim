Plugin 'easymotion/vim-easymotion'

let g:EasyMotion_do_mapping = 0 " Disable default mappings

nmap <leader>s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)

" TODO n-character search motions
" https://github.com/easymotion/vim-easymotion#n-character-search-motion

" TODO repeat motions
" https://github.com/easymotion/vim-easymotion#repeat-motions
