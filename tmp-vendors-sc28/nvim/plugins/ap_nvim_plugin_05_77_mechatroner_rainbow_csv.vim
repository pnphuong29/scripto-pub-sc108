" https://github.com/mechatroner/rainbow_csv

autocmd BufNewFile,BufRead *.csv   set filetype=csv_semicolon
autocmd BufNewFile,BufRead *.dat   set filetype=csv_pipe

" set ft=rfc_csv

let g:rbql_with_headers = 1
let g:rcsv_max_columns = 30 " Default = 30
let g:disable_rainbow_key_mappings = 1
" let g:disable_rainbow_hover = 1
" let g:disable_rainbow_csv_autodetect = 1
