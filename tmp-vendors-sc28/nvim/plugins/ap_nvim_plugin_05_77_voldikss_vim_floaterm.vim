" https://github.com/voldikss/vim-floaterm#options

" Key maps
let g:floaterm_keymap_new = '<C-A-n>'
" let g:floaterm_keymap_prev = ''
let g:floaterm_keymap_next = '<Leader>]'
let g:floaterm_keymap_first = '<Leader>['
" let g:floaterm_keymap_last = ''
" let g:floaterm_keymap_hide = ''
" let g:floaterm_keymap_show = ''
" let g:floaterm_keymap_kill = ''
let g:floaterm_keymap_toggle = '<A-t>' 

" Type String. Default: &shell
" let g:floaterm_shell = 

" Type String. Show floaterm info(e.g., 'floaterm: 1/3' implies there are 3 floaterms in total and the current is the first one) at the top left corner of floaterm window.
" Default: 'floaterm: $1/$2'($1 and $2 will be substituted by 'the index of the current floaterm' and 'the count of all floaterms' respectively)
" Example: 'floaterm($1|$2)'
" let g:floaterm_title = 

" Type String. 'float'(nvim's floating or vim's popup) by default. Set it to 'split' or 'vsplit' if you don't want to use floating or popup window.
" let g:floaterm_wintype = 

" Type Number (number of columns) or Float (between 0 and 1). If Float, the width is relative to &columns.
" Default: 0.6
let g:floaterm_width = 0.9

" Type Number (number of lines) or Float (between 0 and 1). If Float, the height is relative to &lines.
" Default: 0.6
let g:floaterm_height = 0.9

" Type String. The position of the floating window. Available values:
" If wintype is split/vsplit: 'leftabove', 'aboveleft', 'rightbelow', 'belowright', 'topleft', 'botright'. Default: 'botright'.
" It's recommended to have a look at those options meanings, e.g. :help :leftabove.
" If wintype is float: 'top', 'bottom', 'left', 'right', 'topleft', 'topright', 'bottomleft', 'bottomright', 'center', 'auto'(at the cursor place). Default: 'center'
" In addition, there is another option 'random' which allows to pick a random position from above when (re)opening a floaterm window.
" let g:floaterm_position = 

" Type String. 8 characters of the floating window border (top, right, bottom, left, topleft, topright, botright, botleft).
" Default: ─│─│┌┐┘└
" let g:floaterm_borderchars = 

" Type List of String. Markers used to detect the project root directory for --cwd=<root>
" Default: ['.project', '.git', '.hg', '.svn', '.root']
" let g:floaterm_rootmarkers = 

" Type String. Command used for opening a file in the outside nvim from within :terminal.
" Available: 'edit', 'split', 'vsplit', 'tabe', 'drop' or user-defined commands
" Default: 'split'
" let g:floaterm_opener = 

" Type Number. Whether to close floaterm window once the job gets finished.
" 0: Always do NOT close floaterm window
" 1: Close window if the job exits normally, otherwise stay it with messages like [Process exited 101]
" 2: Always close floaterm window
" Default: 1.
" let g:floaterm_autoclose = 

" Type Number. Whether to hide previous floaterms before switching to or opening a another one.
" 0: Always do NOT hide previous floaterm windows
" 1: Only hide those whose position (b:floaterm_position) is identical to that of the floaterm which will be opened
" 2: Always hide them
" Default: 1.
" let g:floaterm_autohide = 

" Type Boolean. Whether to enter Terminal-mode after opening a floaterm.
" Default: v:true
" let g:floaterm_autoinsert = true
