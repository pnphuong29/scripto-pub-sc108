let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_focus_on_files = 1
let g:nerdtree_tabs_autofind = 1
nmap <unique> <F1> <C-w>w
imap <unique> <F1> <Esc><C-w>w
nnoremap <unique> <F4> :NERDTreeTabsToggle<CR>:vertical resize 35<CR>
inoremap <unique> <F4> <Esc>:NERDTreeTabsToggle<CR>:vertical resize 35<CR>
