" https://github.com/sonph/onehalf
" https://github.com/sonph/onehalf/blob/master/vim/README.md

" if $AP_NVIM_COLOR_SCHEME == 'onehalflight'
if ap_nvim_color_scheme == 'onehalflight'
	if exists('+termguicolors')
		let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
		let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
		set termguicolors
	endif

	set t_Co=256
	set cursorline
endif

" if $AP_NVIM_COLOR_SCHEME == 'onehalfdark'
if ap_nvim_color_scheme == 'onehalfdark'
	if exists('+termguicolors')
		let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
		let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
		set termguicolors
	endif

	set t_Co=256
	set cursorline
endif
