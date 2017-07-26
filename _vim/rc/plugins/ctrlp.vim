Plugin 'ctrlpvim/ctrlp.vim'

let g:ctrlp_working_path_mode = 'rw'
let g:ctrlp_show_hidden=1
let g:ctrlp_max_files=0
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn|idea)|build|public|node_modules|vendor)$',
  \ 'file': '\v\.(exe|so|dll|o|obj|class|png|jpg|jpeg|mp3|mp4)$',
\}
