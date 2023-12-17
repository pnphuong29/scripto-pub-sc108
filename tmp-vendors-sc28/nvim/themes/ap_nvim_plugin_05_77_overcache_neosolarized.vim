" https://github.com/overcache/NeoSolarized

" if $AP_NVIM_COLOR_SCHEME == 'NeoSolarized'
if ap_nvim_color_scheme == 'NeoSolarized'
	if exists("&termguicolors") && exists("&winblend")
		syntax enable
		set termguicolors
		set winblend=0
		set wildoptions=pum
		set pumblend=5
		" set background=dark
		set background=white

		let g:neosolarized_termtrans=1
	endif
endif
