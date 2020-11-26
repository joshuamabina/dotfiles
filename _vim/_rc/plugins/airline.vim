Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

if exists(':AirlineRefresh')
    set noshowmode
endif

let g:airline_powerline_fonts=0

let g:airline_left_sep=''
let g:airline_right_sep=''

let g:airline#extensions#tabline#enabled=1
let g:airline#extesions#tabline#tab_min_count=3
let g:airline#extensions#tabline#show_buffers=0

let g:airline_theme='minimalist'
