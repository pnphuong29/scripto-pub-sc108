" https://github.com/vim-airline/vim-airline
" https://github.com/vim-airline/vim-airline-themes
" https://github.com/vim-airline/vim-airline/wiki/Screenshots

" let g:airline_theme = 'simple'
" let g:airline_theme='wombat'
let g:airline_theme = 'bubblegum'
" let g:airline_theme = ap_nvim_color_scheme

if $AP_NVIM_COLOR_SCHEME == 'onehalflight'
	" let g:airline_theme='onehalflight'
	let g:airline_theme = 'bubblegum'
endif

if $AP_NVIM_COLOR_SCHEME == 'onehalfdark'
	" let g:airline_theme='onehalfdark'
	let g:airline_theme='onehalflight'
endif

if $AP_NVIM_COLOR_SCHEME == 'everforest'
	let g:airline_theme = 'everforest'
endif

" let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '|'
let g:airline#extensions#tabline#left_alt_sep = '|'
" let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#formatter = 'unique_tail'
