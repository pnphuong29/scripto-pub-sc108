" https://github.com/neoclide/coc-prettier
" https://prettier.io/docs/en/configuration.html

command! -nargs=0 Prettier :CocCommand prettier.formatFile

nnoremap <unique><nowait> <A-e> :CocCommand prettier.formatFile<CR>
inoremap <unique><nowait> <A-e> <Esc>:CocCommand prettier.formatFile<CR>
