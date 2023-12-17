noremap <unique> <A-/> :Commentary<CR>
inoremap <unique> <A-/> <Esc>:Commentary<CR>i

autocmd BufNewFile,BufRead Dockerfile setlocal commentstring=#\ %s
autocmd BufNewFile,BufRead *.Dockerfile setlocal commentstring=#\ %s
autocmd BufNewFile,BufRead Caddyfile setlocal commentstring=#\ %s
autocmd BufNewFile,BufRead *.Caddyfile setlocal commentstring=#\ %s
autocmd BufNewFile,BufRead .env setlocal commentstring=#\ %s
autocmd BufNewFile,BufRead .env.* setlocal commentstring=#\ %s
autocmd BufNewFile,BufRead *.conf setlocal commentstring=#\ %s
autocmd BufNewFile,BufRead .gitignore setlocal commentstring=#\ %s
autocmd BufNewFile,BufRead *.sql setlocal commentstring=--\ %s
autocmd BufNewFile,BufRead *.php setlocal commentstring=//\ %s
autocmd BufNewFile,BufRead *.cnf setlocal commentstring=#\ %s
