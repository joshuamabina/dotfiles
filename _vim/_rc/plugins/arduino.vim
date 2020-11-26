" Plugin 'tclem/vim-arduino'

" let g:vim_arduino_library_path = /path/to/arduino/installation
" let g:vim_arduino_serial_port = $(ls /dev/tty.* | grep usb)

au BufRead,BufNewFile *.pde set filetype=arduino
au BufRead,BufNewFile *.ino set filetype=arduino

map <buffer> <F3> :<Esc>:w<CR>:!clear<CR>:!ino build<CR>:!ino upload<CR>: <Ins> <CR>
