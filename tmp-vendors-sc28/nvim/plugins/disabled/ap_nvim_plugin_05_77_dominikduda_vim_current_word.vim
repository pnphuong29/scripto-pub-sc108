" https://github.com/dominikduda/vim_current_word

" Enable/disable plugin
let g:vim_current_word#enabled = 1

" Twins of word under cursor:
let g:vim_current_word#highlight_twins = 1

" The word under cursor:
let g:vim_current_word#highlight_current_word = 1

" Setting this option to more than 0 will enable delayed highlighting. 
" The value of this variable is a delay in milliseconds.
let g:vim_current_word#highlight_delay = 0

" Enable/disable highlighting only in focused window:
let g:vim_current_word#highlight_only_in_focused_window = 1

" Blacklist filetypes
let g:vim_current_word#excluded_filetypes = ['']

" Blacklist buffers
" autocmd BufAdd NERD_tree_*,your_buffer_name.rb,*.js :let b:vim_current_word_disabled_in_this_buffer = 1
