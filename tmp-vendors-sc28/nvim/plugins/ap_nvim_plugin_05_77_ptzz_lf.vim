" https://github.com/ptzz/lf.vim

" Disable the default key mapping
" let g:lf_map_keys = 0

" Set floaterm window size
" let g:lf_width=500
" let g:lf_height=500

" Custom lf command
" let g:lf_command_override = 'lf -command "set hidden"'

" Map keys
nnoremap <unique> <A-1> :LfCurrentFileExistingOrNewTab<CR>
inoremap <unique> <A-1> <Esc>:LfCurrentFileExistingOrNewTab<CR>
