Plugin 'stephpy/vim-php-cs-fixer'

let g:php_cs_fixer_rules='@Symfony'

nnoremap <silent> <leader>pcd :call PhpCsFixerFixDirectory()<CR>
nnoremap <silent> <leader>pcf :call PhpCsFixerFixFile()<CR>
