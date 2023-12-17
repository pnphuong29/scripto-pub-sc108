" ------- Tab management -------
" Jump to previous tab
nnoremap <unique> <nowait> <S-Tab> :tabprevious<CR>
" nnoremap <unique> <nowait> <A-Left> :tabprevious<CR>
" inoremap <unique> <A-Left> <Esc>:tabprevious<CR>

" Jump to next tab
nnoremap <unique> <nowait> <Tab> gt
" nnoremap <unique> <nowait> <A-Right> :tabnext<CR>
" inoremap <unique> <nowait> <A-Right> <Esc>:tabnext<CR>

" Create a new file at current directory
nnoremap <unique> <nowait> <A-n> :tabnew %:h/
inoremap <unique> <nowait> <A-n> <Esc>:tabnew %:h/

" Move current tab to the previous position
nnoremap <unique> <nowait> <A-[> :tabmove -1<CR>
inoremap <unique> <nowait> <A-[> <Esc>:tabmove -1<CR>i

" Move current tab to the next position
nnoremap <unique> <nowait> <A-]> :tabmove +1<CR>
inoremap <unique> <nowait> <A-]> <Esc>:tabmove +1<CR>i

" ------- Window management -------
" Move cursor to the left window
nnoremap <unique> <nowait> <A-,> <C-w>h
" nnoremap <unique> <nowait> <A-j> <C-w>h
nnoremap <unique> <nowait> <A-h> <C-w>h
inoremap <unique> <nowait> <A-,> <C-w>h
" inoremap <unique> <nowait> <A-j> <C-w>h
inoremap <unique> <nowait> <A-h> <C-w>h

" Move cursor to the right window
nnoremap <unique> <nowait> <A-.> <C-w>l
nnoremap <unique> <nowait> <A-l> <C-w>l
inoremap <unique> <nowait> <A-.> <Esc><C-w>l
inoremap <unique> <nowait> <A-l> <Esc><C-w>l

" Move cursor to the upper window
" nnoremap <unique> <nowait> <A-i> <C-w>k
nnoremap <unique> <nowait> <A-k> <C-w>k
" inoremap <unique> <nowait> <A-i> <Esc><C-w>k
inoremap <unique> <nowait> <A-k> <Esc><C-w>k

" Move cursor to the lower window
" nnoremap <unique> <nowait> <A-k> <C-w>j
nnoremap <unique> <nowait> <A-j> <C-w>j
" inoremap <unique> <nowait> <A-k> <Esc><C-w>j
inoremap <unique> <nowait> <A-j> <Esc><C-w>j

" Resize width of the window 1 column to the left
nnoremap <unique> <nowait> <C-A-j> <C-w><
inoremap <unique> <nowait> <C-A-J> <C-w><i

" Resize width of the window 1 column to the right
nnoremap <unique> <nowait> <C-A-l> <C-w>>
inoremap <unique> <nowait> <C-A-l> <C-w>>i

" Resize height of the window 1 row up
nnoremap <unique> <nowait> <C-A-i> <C-w>-
inoremap <unique> <nowait> <C-A-i> <C-w>-i

" Resize height of the window 1 row down
nnoremap <unique> <nowait> <C-A-k> <C-w>+
inoremap <unique> <nowait> <C-A-k> <C-w>+i

" Resize window equally
nnoremap <unique> <nowait> <A-+> <C-w>=
inoremap <unique> <nowait> <A-+> <C-w>=i

" New vertical split window
nnoremap <unique> <nowait> <A-\> :vnew 
inoremap <unique> <nowait> <A-\> <Esc>:vnew 

" New horizontal split window
nnoremap <unique> <nowait> <A--> :hnew 
inoremap <unique> <nowait> <A--> <Esc>:new 

" Close window
nnoremap <unique> <nowait> <A-w> <C-w>q
inoremap <unique> <nowait> <A-w> <Esc><C-w>q

" Exit
nnoremap <unique> <nowait> <A-q> :qall<CR>
inoremap <unique> <nowait> <A-q> <Esc>:qall<CR>

" Save changes
nnoremap <unique> <nowait> <A-s> :w<CR>
inoremap <unique> <nowait> <A-s> <Esc>:w<CR>
" inoremap <unique> <nowait> <A-s> <Esc>:w<CR>i

" ------- Session mangement -------

" Load VIM session
nnoremap <unique> <nowait> <F10> :source $AP_PRJ_WS7_DIR/ws.vim
inoremap <unique> <nowait> <F10> <Esc>:source $AP_PRJ_WS7_DIR/ws.vim

" Save current VIM session to default file
nnoremap <unique> <nowait> <Leader>0 :mksession! $AP_PRJ_WS7_DIR/ws.vim
inoremap <unique> <nowait> <Leader>0 <Esc>:mksession! $AP_PRJ_WS7_DIR/ws.vim

" Save current VIM session to ws9
nnoremap <unique> <nowait> <Leader>9 :mksession! $AP_PRJ_WS7_DIR/ws9.vim<CR>
inoremap <unique> <nowait> <Leader>9 <Esc>:mksession! $AP_PRJ_WS7_DIR/ws9.vim<CR>

" Save current VIM session to ws8
nnoremap <unique> <nowait> <Leader>8 :mksession! $AP_PRJ_WS7_DIR/ws8.vim<CR>
inoremap <unique> <nowait> <Leader>8 <Esc>:mksession! $AP_PRJ_WS7_DIR/ws8.vim<CR>

" Save current VIM session to ws7
nnoremap <unique> <nowait> <Leader>7 :mksession! $AP_PRJ_WS7_DIR/ws7.vim<CR>
inoremap <unique> <nowait> <Leader>7 <Esc>:mksession! $AP_PRJ_WS7_DIR/ws7.vim<CR>

" Save current VIM session to ws6
nnoremap <unique> <nowait> <Leader>6 :mksession! $AP_PRJ_WS7_DIR/ws6.vim<CR>
inoremap <unique> <nowait> <Leader>6 <Esc>:mksession! $AP_PRJ_WS7_DIR/ws6.vim<CR>

" Save current VIM session to ws5
nnoremap <unique> <nowait> <Leader>5 :mksession! $AP_PRJ_WS7_DIR/ws5.vim<CR>
inoremap <unique> <nowait> <Leader>5 <Esc>:mksession! $AP_PRJ_WS7_DIR/ws5.vim<CR>

" ------- Others -------
" Turn off highlight
nnoremap <nowait> <A-3> :noh<CR>
inoremap <nowait> <A-3> <Esc>:noh<CR>i


" Cut a line
nnoremap <unique> <nowait> <A-x> dd
inoremap <unique> <nowait> <A-x> <Esc>ddi

" Move cursor to the beginning of line
nnoremap <nowait> <C-a> 0
inoremap <nowait> <C-a> <Esc>0i

" Move cursor to the end of line
nnoremap <nowait> <C-e> $
inoremap <nowait> <C-e> <Esc>$i

" Move cursor to the left word
nnoremap <unique> <nowait> <A-Left> b
inoremap <unique> <nowait> <A-Left> <Esc>bi
" nnoremap <silent> <nowait> <A-h> b
" inoremap <silent> <nowait> <A-h> <Esc>bi

" Move cursor to the right word
nnoremap <unique> <nowait> <A-Right> w
inoremap <unique> <nowait> <A-Right> <C-o>w
" nnoremap <silent> <nowait> <A-l> w
" inoremap <silent> <nowait> <A-l> <C-o>w

" Switch to select mode for copying to the lhs in insert mode
inoremap <unique> <nowait> <S-Left> <Esc>v<Left>b

" Switch to select mode for copying to the rhs in insert mode
inoremap <unique> <nowait> <S-Right> <Esc><Right>v<Right>w

" Copy from the current cursor position to the end of line
nnoremap <unique> <nowait> <S-End> v$<Left>
inoremap <unique> <nowait> <S-End> <Esc><Right>v$<Left>
inoremap <unique> <nowait> <S-$> <Esc><Right>v$<Left>

" Copy from the current cursor position to the beginning of line
nnoremap <unique> <nowait> <S-Home> v0
inoremap <unique> <nowait> <S-Home> <Esc>v0
inoremap <unique> <nowait> <S-0> <Esc>v0

" Move cursor down N lines
nnoremap <unique> <nowait> <S-Down> :+7<CR>
inoremap <unique> <nowait> <S-Down> <Esc>:+7<CR>
" nnoremap <unique> <nowait> <A-j> :+7<CR>
" inoremap <unique> <nowait> <A-j> <Esc>:+7<CR>
noremap <unique> <nowait> <PageDown> :+14<CR>
inoremap <unique> <nowait> <PageDown> <Esc>:+14<CR>

" Move cursor up N lines
nnoremap <unique> <nowait> <S-Up> :-7<CR>
inoremap <unique> <nowait> <S-Up> <Esc>:-7<CR>
" nnoremap <unique> <nowait> <A-k> :-7<CR>
" inoremap <unique> <nowait> <A-k> <Esc>:-7<CR>
nnoremap <unique> <nowait> <PageUp> :-14<CR>
inoremap <unique> <nowait> <PageUp> <Esc>:-14<CR>

" Press Enter <CR> in normal mode
nnoremap <unique> <nowait> <CR> i<CR>

" Press Backspace <BS> in normal mode
nnoremap <unique> <nowait> <BS> i<BS>

" Press Del <Del> in normal mode
nnoremap <unique> <nowait> <Del> i<Del>

" Press Space <Space> in normal mode
nnoremap <unique> <nowait> <Space> i

" Copy
nnoremap <unique> <nowait> <A-c> yy
vnoremap <unique> <nowait> <A-c> yy<ESC>i
inoremap <unique> <nowait> <A-c> <Esc>yyi

" Paste
nnoremap <unique> <nowait> <A-v> p
inoremap <unique> <nowait> <A-v> <Esc>p<Right>

" Undo changes
nnoremap <unique> <nowait> <A-z> u
inoremap <unique> <nowait> <A-z> <Esc>u

" Delete all characters from the cursor postion to the end of line
nnoremap <unique> <nowait> <A-d> d$
inoremap <unique> <nowait> <A-d> <Esc><Right>d$i

" Delete all characters from the cursor postion to the beginning of line
nnoremap <unique> <nowait> <A-b> d0
inoremap <unique> <nowait> <A-b> <Esc><Right>d0i

" Open current file in Chrome
nnoremap <unique> <nowait> <A-o> :exe ':silent !open %'<CR>
inoremap <unique> <nowait> <A-o> <Esc>:exe ':silent !open %'<CR>i
