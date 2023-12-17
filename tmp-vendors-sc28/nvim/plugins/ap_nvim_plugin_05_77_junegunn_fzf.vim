let g:fzf_command_prefix = 'Fzf'

" - CTRL-/ will toggle preview window.
" - Note that this array is passed as arguments to fzf#vim#with_preview function.
" - To learn more about preview window options, see `--preview-window` section of `man fzf`.
" let g:fzf_preview_window = ['down:40%:hidden', 'ctrl-/']
let g:fzf_preview_window = ['down:60%', 'ctrl-/']

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

let g:fzf_action = {
	\ 'enter': 'tab split',
	\ 'ctrl-t': 'tab split',
  	\ 'ctrl-h': 'split',
  	\ 'ctrl-v': 'vsplit' }

" Enable per-command history
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
let g:fzf_history_dir = '$AP_PRJ_SCRIPTS_DIR/data/fzf'

" Search current buffer
nnoremap <unique> <A-f> :FzfBLines<CR>
inoremap <unique> <A-f> <Esc>:FzfBLines<CR>

" Ripgrep projects directory
nnoremap <unique> <A-g> :FzfRg<CR>
inoremap <unique> <A-g> <Esc>:FzfRg<CR>

" Search history files
nnoremap <unique> <F1> :FzfHistory<CR>
inoremap <unique> <F1> <Esc>:FzfHistory<CR>

" Search home directory
nnoremap <unique> <F2> :FzfFiles $HOME<CR>
inoremap <unique> <F2> <Esc>:FzfFiles $HOME<CR>

" Search user home directory
nnoremap <unique> <A-F2> :FzfFiles $AP_PRJ_DIR<CR>
inoremap <unique> <A-F2> <Esc>:FzfFiles $AP_PRJ_DIR<CR>

" Ripgrep projects
nnoremap <unique> <F3> :cd $AP_PRJ_DIR<CR>:FzfRg<CR>
inoremap <unique> <F3> <Esc>:cd $AP_PRJ_DIR<CR>:FzfRg<CR>

" Ripgrep snippets project
nnoremap <unique> <F4> :cd $AP_PRJ_KB7_DIR<CR>:FzfRg<CR>
inoremap <unique> <F4> <Esc>:cd $AP_PRJ_KB7_DIR<CR>:FzfRg<CR>

" if you open fzf on the bottom on the screen (e.g. {'down': '40%'}), you might want to temporarily disable the statusline for a cleaner look.
" let g:fzf_layout = { 'down': '30%' }
" autocmd! FileType fzf
" autocmd  FileType fzf set laststatus=0 noshowmode noruler
"   \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" [[B]Commits] Customize the options used by 'git log':
" let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
" let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
" let g:fzf_commands_expect = 'alt-enter,ctrl-x'

" An action can be a reference to a function that processes selected lines
" function! s:build_quickfix_list(lines)
"   call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
"   copen
"   cc
" endfunction

" let g:fzf_action = {
"   \ 'ctrl-q': function('s:build_quickfix_list'),
"   \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - Popup window (center of the screen)
" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" - Popup window (center of the current window)
" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true } }

" - Popup window (anchored to the bottom of the current window)
" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true, 'yoffset': 1.0 } }

" - down / up / left / right
" let g:fzf_layout = { 'down': '40%' }

" - Window using a Vim command
" let g:fzf_layout = { 'window': 'enew' }
" let g:fzf_layout = { 'window': '-tabnew' }
" let g:fzf_layout = { 'window': '10new' }

" Color themes
" let g:fzf_colors =
" \ { 'fg':         ['fg', 'Normal'],
"   \ 'bg':         ['bg', 'Normal'],
"   \ 'preview-bg': ['bg', 'NormalFloat'],
"   \ 'hl':         ['fg', 'Comment'],
"   \ 'fg+':        ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"   \ 'bg+':        ['bg', 'CursorLine', 'CursorColumn'],
"   \ 'hl+':        ['fg', 'Statement'],
"   \ 'info':       ['fg', 'PreProc'],
"   \ 'border':     ['fg', 'Ignore'],
"   \ 'prompt':     ['fg', 'Conditional'],
"   \ 'pointer':    ['fg', 'Exception'],
"   \ 'marker':     ['fg', 'Keyword'],
"   \ 'spinner':    ['fg', 'Label'],
"   \ 'header':     ['fg', 'Comment'] }
