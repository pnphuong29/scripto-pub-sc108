let g:clap_theme = 'material_design_dark'
autocmd FileType clap_input let g:completion_enable_auto_pop = 0

"" Change the CamelCase of related highlight group name to under_score_case.
let g:clap_theme = { 'search_text': {'guifg': 'red', 'ctermfg': 'red'} }

"" Open Clap Filer | Explorer
nnoremap <F1> :Clap filer<CR>
inoremap <F1> <Esc>:Clap filter<CR>
