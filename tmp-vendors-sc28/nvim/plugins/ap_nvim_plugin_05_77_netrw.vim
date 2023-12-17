" https://vimhelp.org/pi_netrw.txt.html#g%3Anetrw_keepdir
" =1 (default) keep current directory immune from the browsing directory.
" =0 keep the current directory the same as the browsing directory.
let g:netrw_keepdir = 0

" The g:netrw_winsize is an integer describing the percentage of the
" current netrw buffer's window to be used for the new window.
" let g:netrw_winsize = 50

" when browsing, <cr> will open the file by:
" =0: re-using the same window  (default)
" =1: horizontally splitting the window first
" =2: vertically   splitting the window first
" =3: open file in new tab
" =4: act like "P" (ie. open previous window)
let g:netrw_browse_split = 3


" Set the default listing style:
" = 0: thin listing (one file per line)
" = 1: long listing (one file per line with timestamp information and file size)
" = 2: wide listing (multiple files in columns)
" = 3: tree style listing
let g:netrw_liststyle = 3
" let g:netrw_liststyle = 0

" comma separated pattern list for hiding files
let g:netrw_list_hide = ''

" =0: slow speed directory browsing; never re-uses directory listings; always obtains directory listings.
" =1: medium speed directory browsing; re-use directory listings only when remote directory browsing. (default value)
" =2: fast directory browsing; only obtains directory listings when the directory hasn't been seen before (or netrw-ctrl-l is used).
let g:netrw_fastbrowse = 0

" Close explorer immediately if current focus is on netrw explorer
autocmd Filetype netrw nnoremap <buffer> <nowait> q :Lexplore<CR>

" Remap F1 key to overwrite showing help default behavior in Netwr Explorer
autocmd Filetype netrw nnoremap <buffer> <nowait> <F1> :FzfHistory<CR>

" Toggle explorer
function! ToggleNetrwExplorer()
	let s:buf_info_str = string(getbufinfo())
	if match(s:buf_info_str, "netrw_browser_active") > 0
		Lexplore
	else
		Lexplore %:p:h
		vertical resize 60
	endif
	
	nnoremap <buffer><nowait> <S-Down> 3<Down>
	nnoremap <buffer><nowait> <S-Up> 3<Up>
endfunction

nnoremap <unique> <A-2> :call ToggleNetrwExplorer()<CR>
inoremap <unique> <A-2> <Esc>:call ToggleNetrwExplorer()<CR>

" Close explorer if any before switching to newly open tab
function! CloseNetwrExplorers()
	for tab in gettabinfo()
		if has_key(tab['variables'], 'netrw_lexbufnr') 
			if tab['tabnr'] == tabpagenr()
				Lexplore
			endif
		endif
	endfor
endfunction

autocmd TabLeave * call CloseNetwrExplorers()
