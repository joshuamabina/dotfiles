Plugin 'artur-shaik/vim-javacomplete2'

autocmd FileType java setlocal omnifunc=javacomplete#Complete

if (&ft=='java')
    nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
    imap <F4> <Plug>(JavaComplete-Imports-AddSmart)

    nmap <F5> <Plug>(JavaComplete-Imports-Add)
    imap <F5> <Plug>(JavaComplete-Imports-Add)

    nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
    imap <F6> <Plug>(JavaComplete-Imports-AddMissing)
endif
