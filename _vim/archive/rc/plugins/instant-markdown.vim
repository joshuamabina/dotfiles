Plugin 'suan/vim-instant-markdown'

let g:instant_markdown_autostart=0

if (&ft=='markdown')
    nmap <silent> <leader>md :InstantMarkdownPreview<CR> :echo "Preview at http://localhost:8090"<CR>
endif
