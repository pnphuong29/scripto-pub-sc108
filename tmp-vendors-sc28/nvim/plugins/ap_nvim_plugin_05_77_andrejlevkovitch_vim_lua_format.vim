" https://github.com/andrejlevkovitch/vim-lua-format
autocmd FileType lua nnoremap <buffer> <c-k> :call LuaFormat()<cr>
autocmd BufWrite *.lua call LuaFormat()
