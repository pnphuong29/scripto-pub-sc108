" https://github.com/sainnhe/everforest
" https://github.com/sainnhe/everforest/blob/master/doc/everforest.txt

" if $AP_NVIM_COLOR_SCHEME == 'everforest'
if ap_nvim_color_scheme == 'everforest'
	" Important!!
	if has('termguicolors')
		set termguicolors
	endif

	" For dark version.
	set background=dark

	" For light version.
	" set background=light

	" Set contrast.
	" This configuration option should be placed before `colorscheme everforest`.
	" Available values: 'hard', 'medium'(default), 'soft'
	let g:everforest_background = 'soft'

	" For better performance
	let g:everforest_better_performance = 1

	" Transparent background
	" let g:everforest_transparent_background = 1
	
	" Disable terminal colors provided by this color scheme
	let g:everforest_disable_terminal_colors = 1
endif
